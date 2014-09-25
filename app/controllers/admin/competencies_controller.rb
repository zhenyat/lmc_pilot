class Admin::CompetenciesController < ApplicationController
  layout 'admin'

  before_action :set_competency, only: [:show, :edit, :update, :destroy]

  # GET /admin/competencies
  # GET /admin/competencies.json
  def index
    @positions    = Position.order('title')
    @competencies = Competency.all
  end

  # GET /admin/competencies/1
  # GET /admin/competencies/1.json
  def show
  end

  # GET /admin/competencies/new
  def new
    @competency = Competency.new
    @positions  = Position.order('title')
    @clusters   = Cluster.order('title')
  end

  # GET /admin/competencies/1/edit
  def edit
    @positions  = Position.order('title')
    @clusters   = Cluster.order('title')
  end

  # POST /admin/competencies
  # POST /admin/competencies.json
  def create
    @competency = Competency.new(competency_params)

    respond_to do |format|
      if @competency.save
        format.html { redirect_to [:admin, @competency], notice: 'Competency was successfully created.' }
        format.json { render action: 'show', status: :created, location: @competency }
      else
        format.html { render action: 'new' }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/competencies/1
  # PATCH/PUT /admin/competencies/1.json
  def update
    respond_to do |format|
      if @competency.update(competency_params)
        format.html { redirect_to [:admin, @competency], notice: 'Competency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/competencies/1
  # DELETE /admin/competencies/1.json
  def destroy
    @competency.destroy
    respond_to do |format|
      format.html { redirect_to admin_competencies_url, notice: 'Competency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_cluster
    session[:cluster_id] = params[:cluster][:cluster_id]
    redirect_to :back
  end

  def set_position
    session[:position_id] = params[:position][:position_id]
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competency
      @competency = Competency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competency_params
      params.require(:competency).permit(:position_id, :cluster_id, :name, :title, :rank, :description)
    end
end
