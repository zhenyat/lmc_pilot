class Admin::ActioncardsController < ApplicationController
  layout 'admin'

  before_action :set_actioncard, only: [:show, :edit, :update, :destroy]

  # GET /admin/actioncards
  # GET /admin/actioncards.json
  def index
    @clusters     = Cluster.all
    @positions    = Position.order('title')
    @competencies = Competency.all
    @levels       = Level.all
    @actioncards  = Actioncard.all
  end

  # GET /admin/actioncards/1
  # GET /admin/actioncards/1.json
  def show
  end

  # GET /admin/actioncards/new
  def new
    @actioncard = Actioncard.new
  end

  # GET /admin/actioncards/1/edit
  def edit
  end

  # POST /admin/actioncards
  # POST /admin/actioncards.json
  def create
    @actioncard = Actioncard.new(actioncard_params)

    respond_to do |format|
      if @actioncard.save
        format.html { redirect_to [:admin, @actioncard], notice: 'Actioncard was successfully created.' }
        format.json { render action: 'show', status: :created, location: @actioncard }
      else
        format.html { render action: 'new' }
        format.json { render json: @actioncard.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_values_for_actioncard
    session[:position_id] = params[:values][:position_id]
    session[:cluster_id]  = params[:values][:cluster_id]
    session[:level_id]    = params[:values][:level_id]
    redirect_to :back
  end

  # PATCH/PUT /admin/actioncards/1
  # PATCH/PUT /admin/actioncards/1.json
  def update
    respond_to do |format|
      if @actioncard.update(actioncard_params)
        format.html { redirect_to [:admin, @actioncard], notice: 'Actioncard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @actioncard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/actioncards/1
  # DELETE /admin/actioncards/1.json
  def destroy
    @actioncard.destroy
    respond_to do |format|
      format.html { redirect_to admin_actioncards_url, notice: 'Actioncard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actioncard
      @actioncard = Actioncard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actioncard_params
      params.require(:actioncard).permit(:competency_id, :level_id, :content)
    end
end
