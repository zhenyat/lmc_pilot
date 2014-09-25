class AssessmentsController < ApplicationController

  before_action :set_assessment, only: [:show, :edit, :update, :destroy]

  # POST /assessments
  # POST /assessments.json
  def create
    @assessment = Assessment.new(assessment_params)

    respond_to do |format|
      if @assessment.save
        format.html { redirect_to @assessment, notice: 'Assessment was successfully created.' }
        format.json { render :show, status: :created, location: @assessment }
      else
        format.html { render :new }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /assessments/1/edit
  def edit
    @user  = User.find session[:user_id]
    @assessment_items = Item.where assessment_id: @assessment.id
  end

  # Finalized the assessment by Manager
  def final_form
    @user       = User.find params[:user_id]
    @assessment = Assessment.find params[:assessment_id]

    # To accumulate levels
    level_name    = @user.level.name
    beginner_id   = Level.find_by(name: 'beginner').id
    specialist_id = Level.find_by(name: 'specialist').id
    master_id     = Level.find_by(name: 'master').id
    expert_id     = Level.find_by(name: 'expert').id

    session[:levels] = []
    case level_name
    when 'beginner'
      session[:levels] = [beginner_id, specialist_id, master_id, expert_id]
    when 'specialist'
      session[:levels] =              [specialist_id, master_id, expert_id]
    when 'master'
      session[:levels] =                             [master_id, expert_id]
    when 'expert'
      session[:levels] =                                        [expert_id]
    else
      # nothing here
      puts "ZT-Error! incorrect Level name (assessments/new)"
    end
  end

  # Handles submitted data from Final Assessment Form
  def handle_final
    user       = User.find params[:assessment][:user_id]
    assessment = Assessment.find params[:assessment][:assessment_id]
    params[:assessment][:items][:final_tick].each do |behavior_id, final_tick|
      item = Item.find_by assessment_id: assessment.id, behavior_id: behavior_id
      item.final_tick = final_tick
      item.save
    end

    assessment.update(closed: true)

    redirect_to assessment_path(assessment)
  end

  # Handles submitted data from New Assessment Form
  def handle_new
    user_id  = params[:assessment][:user_id]
    level_id = params[:assessment][:level_id]

#    if User.find(user_id).level.id == level_id
#      assessment = Assessment.new user_id: user_id, max_level: level_id
#    else
#      assessment = Assessment.find(params[:assessment][:id])
#    end

    assessment = Assessment.new user_id: user_id, max_level: level_id
    if assessment.save
      params[:assessment][:items][:user_tick].each do |behavior_id, user_tick|
        Item.create assessment_id: assessment.id, behavior_id: behavior_id, user_tick: user_tick
      end

    else

    end
#    render nothing: true
    redirect_to assessment, notice: 'Результаты БОРД успешно сохранены'
  end

  # Handles submitted data from Edit Assessment Form
  def handle_edit
    render nothing: true
  end

  def index
    @user        = User.find session[:user_id]
    @assessments = @user.assessments
  end

  # GET /assessments/new
  def new
    @user       = User.find session[:user_id]
#   @assessment = Assessment.new   Done by set_assessment

    # To accumulate levels
    level_name    = @user.level.name
    beginner_id   = Level.find_by(name: 'beginner').id
    specialist_id = Level.find_by(name: 'specialist').id
    master_id     = Level.find_by(name: 'master').id
    expert_id     = Level.find_by(name: 'expert').id

    session[:levels] = []
    case level_name
    when 'beginner'
      session[:levels] = [beginner_id, specialist_id, master_id, expert_id]
    when 'specialist'
      session[:levels] =              [specialist_id, master_id, expert_id]
    when 'master'
      session[:levels] =                             [master_id, expert_id]
    when 'expert'
      session[:levels] =                                        [expert_id]
    else
      # nothing here
      puts "ZT-Error! incorrect Level name (assessments/new)"
    end
  end

  def reports
    @user        = User.find session[:user_id]
    @director_id = User.find_by(login: '00000').id

    # Empoyees can see their results only
    if !['00', '97', '99'].include? @user.department.number
      if !@user.manager?
        redirect_to assessments_path
      end
    end
#   redirect_to '/pages/home' if @user.guest?
  end

  # Selects a User to be handled by Manager
  def set_user
    @user                 = User.find params[:user][:subordinate_id]
    session[:position_id] = @user.position_id
    session[:level_id]    = @user.level.id

    assessment = @user.assessments.where(closed: false).last
    if assessment.nil?

      redirect_to :back, notice: "У сотрудника #{@user.full_name} нет открытого процесса"
    else
      redirect_to action: 'final_form', user_id: @user.id, assessment_id: assessment.id
    end

  end

  # GET /assessments/1
  def show
    @user = @assessment.user
    items    = @assessment.items
    data     = Array.new()  # intermediate array
    @matrix  = Array.new()  # output array
    clusters = Cluster.all
#   levels   = Level.where('id in (?)', session[:levels])
    levels       = Level.all
    levels_count = levels.size

    clusters.each do |cluster|

      competencies = Competency.where(cluster_id: Cluster.find(cluster.id), position_id: @user.position.id )

      competencies.each do |competency|
        behaviors = competency.behaviors

        count_by_level = []
        behaviors_by_level = []
        levels.each do |level|
          behaviors_by_level << behaviors.where(level_id: level.id, competency_id: competency.id)
          count_by_level << behaviors.where(level_id: level.id).count
        end
        count_max = count_by_level.max

        if count_max > 0
          data[competency.id] = Array.new count_max
          bhv_row = 0           # behavior row

          levels.each do |level|
            behaviors = behaviors_by_level[level.id-1] if levels_count == 4
            behaviors = behaviors_by_level[level.id-2] if levels_count == 3
            behaviors = behaviors_by_level[level.id-3] if levels_count == 2
            behaviors = behaviors_by_level[level.id-4] if levels_count == 1

            if behaviors.count > 0
              behaviors.each do |behavior|

                if !cluster.mutual?

                  if level.id < @user.level.id
                    data[competency.id][bhv_row] = Array.new 14, ''
                    if behavior.level.name  == 'beginner'
                      data[competency.id][bhv_row][2]  = behavior.content
                      data[competency.id][bhv_row][3]  = false
                      data[competency.id][bhv_row][4]  = false
                    elsif behavior.level.name == 'specialist'
                      data[competency.id][bhv_row][5]  = behavior.content
                      data[competency.id][bhv_row][6]  = false
                      data[competency.id][bhv_row][7]  = false
                    elsif behavior.level.name == 'master'
                      data[competency.id][bhv_row][8]  = behavior.content
                      data[competency.id][bhv_row][9]  = false
                      data[competency.id][bhv_row][10] = false
                    else # 'master'
                      data[competency.id][bhv_row][11] = behavior.content
                      data[competency.id][bhv_row][12] = false
                      data[competency.id][bhv_row][13] = false
                    end
                    data[competency.id][bhv_row][0] = cluster.name
                    data[competency.id][bhv_row][1] = competency.title
                  else
                    items.each do |item|

                      if item.behavior_id == behavior.id

                        data[competency.id][bhv_row] = Array.new 14, ''
                        if item.behavior.level.name  == 'beginner'
                          data[competency.id][bhv_row][2]  = Behavior.find(item.behavior_id).content
                          data[competency.id][bhv_row][3]  = item.user_tick
                          data[competency.id][bhv_row][4]  = item.final_tick
                        elsif item.behavior.level.name == 'specialist'
                          data[competency.id][bhv_row][5]  = Behavior.find(item.behavior_id).content
                          data[competency.id][bhv_row][6]  = item.user_tick
                          data[competency.id][bhv_row][7]  = item.final_tick
                        elsif item.behavior.level.name == 'master'
                          data[competency.id][bhv_row][8]  = Behavior.find(item.behavior_id).content
                          data[competency.id][bhv_row][9]  = item.user_tick
                          data[competency.id][bhv_row][10] = item.final_tick
                        else # 'master'
                          data[competency.id][bhv_row][11] = Behavior.find(item.behavior_id).content
                          data[competency.id][bhv_row][12] = item.user_tick
                          data[competency.id][bhv_row][13] = item.final_tick
                        end
                        data[competency.id][bhv_row][0] = cluster.name
                        data[competency.id][bhv_row][1] = competency.title
                      end
                    end       # items Loop
                  end         # IF level.id < @user.level.id END

                else

                  if level.id < @user.level.id
                    data[competency.id][bhv_row] = Array.new 14, ''
                    if behavior.level.name  == 'beginner'
                      data[competency.id][bhv_row][2]  = behavior.content
                      data[competency.id][bhv_row][3]  = false
                      data[competency.id][bhv_row][4]  = false
                    elsif behavior.level.name == 'specialist'
                      data[competency.id][bhv_row][5]  = behavior.content
                      data[competency.id][bhv_row][6]  = false
                      data[competency.id][bhv_row][7]  = false
                    elsif behavior.level.name == 'master'
                      data[competency.id][bhv_row][8]  = behavior.content
                      data[competency.id][bhv_row][9]  = false
                      data[competency.id][bhv_row][10] = false
                    else # 'master'
                      data[competency.id][bhv_row][11] = behavior.content
                      data[competency.id][bhv_row][12] = false
                      data[competency.id][bhv_row][13] = false
                    end
                    data[competency.id][bhv_row][0] = cluster.name
                    data[competency.id][bhv_row][1] = competency.title
                   else
                    items.each do |item|

                      if item.behavior_id == behavior.id

                        data[competency.id][bhv_row] = Array.new 14, ''
                        if item.behavior.level.name  == 'beginner'
                          data[competency.id][bhv_row][2]  = Behavior.find(item.behavior_id).content
                          data[competency.id][bhv_row][3]  = item.user_tick
                          data[competency.id][bhv_row][4]  = item.final_tick
                        elsif item.behavior.level.name == 'specialist'
                          data[competency.id][bhv_row][5]  = Behavior.find(item.behavior_id).content
                          data[competency.id][bhv_row][6]  = item.user_tick
                          data[competency.id][bhv_row][7]  = item.final_tick
                        elsif item.behavior.level.name == 'master'
                          data[competency.id][bhv_row][8]  = Behavior.find(item.behavior_id).content
                          data[competency.id][bhv_row][9]  = item.user_tick
                          data[competency.id][bhv_row][10] = item.final_tick
                        else # 'master'
                          data[competency.id][bhv_row][11] = Behavior.find(item.behavior_id).content
                          data[competency.id][bhv_row][12] = item.user_tick
                          data[competency.id][bhv_row][13] = item.final_tick
                        end
                        data[competency.id][bhv_row][0] = cluster.name
                        data[competency.id][bhv_row][1] = competency.title
                      end
                    end       # items Loop
                  end         # IF level.id < @user.level.id END
                end           # IF cluster.mutual?  END
                bhv_row += 1
              end         # behaviors Loop
            end           # IF behaviors > 0 END
          end             # levels Loop
        end               # IF count_max > 0 END
      end                 # Competency Loop
    end                   # Cluster Loop

    # Create the output matrix for show
    for v in 1..data.size - 1

      h = []
      x = []
      y = []
      z = []
      u = []

      i=0
      j=0
      k=0
      n=0

      data[v].each do |r|
        unless r.nil?       # to avoid competencies / levels without behaviors
          h[0] = r[0]
          h[1] = r[1]
          if r[2] != ''
            x[i] = Array.new(3,'')
            x[i][1] = r[2]
            x[i][2] = r[3]
            x[i][3] = r[4]
            i += 1
          elsif r[5] != ''
            y[j] = Array.new(3,'')
            y[j][1] = r[5]
            y[j][2] = r[6]
            y[j][3] = r[7]
            j += 1
          elsif r[8] != ''
            z[k] = Array.new(3,'')
            z[k][1] = r[8]
            z[k][2] = r[9]
            z[k][3] = r[10]
            k += 1
          else
            u[n] = Array.new(3,'')
            u[n][1] = r[11]
            u[n][2] = r[12]
            u[n][3] = r[13]
            n += 1
          end
        end
      end

      max = [x.count, y.count, z.count, u.count].max

      @matrix[v] = Array.new(max)

      for m in 1..max
        @matrix[v][m] = Array.new(14, '')
        @matrix[v][m][0] = h[0]
        @matrix[v][m][1] = h[1]
      end

      m = 1
      x.each do |xx|
        @matrix[v][m][2] = xx[1]
        @matrix[v][m][3] = xx[2]
        @matrix[v][m][4] = xx[3]
        m += 1
      end

      m = 1
      y.each do |yy|
        @matrix[v][m][5] = yy[1]
        @matrix[v][m][6] = yy[2]
        @matrix[v][m][7] = yy[3]
        m += 1
      end

      m = 1
      z.each do |zz|
        @matrix[v][m][8]  = zz[1]
        @matrix[v][m][9]  = zz[2]
        @matrix[v][m][10] = zz[3]
        m += 1
      end

      m = 1
      u.each do |uu|
        @matrix[v][m][11] = uu[1]
        @matrix[v][m][12] = uu[2]
        @matrix[v][m][13] = uu[3]
        m += 1
      end
    end           # data Loop
  end

  # PATCH/PUT /assessments/1
  # PATCH/PUT /assessments/1.json
  def update
    render nothing: true
#    respond_to do |format|
#      if @assessment.update(assessment_params)
#        format.html { redirect_to @assessment, notice: 'Assessment was successfully updated.' }
#        format.json { render :show, status: :ok, location: @assessment }
#      else
#        format.html { render :edit }
#        format.json { render json: @assessment.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # DELETE /assessments/1
  # DELETE /assessments/1.json
  def destroy
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to assessments_url, notice: 'Assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_params
      params.require(:assessment).permit(:user_id, :closed, :max_level, item_attributes: [:behavior_id, :user_tick, :manager_tick, :final_tick])
    end
end
