class Admin::BehaviorsController < ApplicationController
  layout 'admin'
  before_action :set_behavior, only: [:show, :edit, :update, :destroy]

  # GET /admin/behaviors
  # GET /admin/behaviors.json
  def index
    @clusters     = Cluster.all
    @positions    = Position.order('title')
    @competencies = Competency.all
    @levels       = Level.all
    @behaviors    = Behavior.all
  end

  # GET /admin/behaviors/1
  # GET /admin/behaviors/1.json
  def show
  end

  # GET /admin/behaviors/new
  def new
    @behavior = Behavior.new
  end

  # GET /admin/behaviors/1/edit
  def edit
  end

  # POST /admin/behaviors
  # POST /admin/behaviors.json
  def create
    @behavior = Behavior.new(behavior_params)

    respond_to do |format|
      if @behavior.save
        format.html { redirect_to [:admin, @behavior], notice: 'Behavior was successfully created.' }
        format.json { render action: 'show', status: :created, location: @behavior }
      else
        format.html { render action: 'new' }
        format.json { render json: @behavior.errors, status: :unprocessable_entity }
      end
    end
  end

  # Sets values for Behavior
  def set_values
    session[:position_id] = params[:values][:position_id]
    session[:cluster_id]  = params[:values][:cluster_id]
    session[:level_id]    = params[:values][:level_id]
    redirect_to :back
  end


  # PATCH/PUT /admin/behaviors/1
  # PATCH/PUT /admin/behaviors/1.json
  def update
    respond_to do |format|
      if @behavior.update(behavior_params)
        format.html { redirect_to [:admin, @behavior], notice: 'Behavior was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @behavior.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/behaviors/1
  # DELETE /admin/behaviors/1.json
  def destroy
    @behavior.destroy
    respond_to do |format|
      format.html { redirect_to admin_behaviors_url, notice: 'Behavior was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_behavior
      @behavior = Behavior.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def behavior_params
      params.require(:behavior).permit(:competency_id, :level_id, :content, :active)
    end
end
