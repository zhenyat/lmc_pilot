class Admin::ClustersController < ApplicationController
  layout 'admin'
  before_action :set_cluster, only: [:show, :edit, :update, :destroy]

  # GET /admin/clusters
  # GET /admin/clusters.json
  def index
    @clusters = Cluster.all
  end

  # GET /admin/clusters/1
  # GET /admin/clusters/1.json
  def show
  end

  # GET /admin/clusters/new
  def new
    @cluster = Cluster.new
  end

  # GET /admin/clusters/1/edit
  def edit
  end

  # POST /admin/clusters
  # POST /admin/clusters.json
  def create
    @cluster = Cluster.new(cluster_params)

    respond_to do |format|
      if @cluster.save
        format.html { redirect_to [:admin, @cluster], notice: 'Cluster was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cluster }
      else
        format.html { render action: 'new' }
        format.json { render json: @cluster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/clusters/1
  # PATCH/PUT /admin/clusters/1.json
  def update
    respond_to do |format|
      if @cluster.update(cluster_params)
        format.html { redirect_to [:admin, @cluster], notice: 'Cluster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cluster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/clusters/1
  # DELETE /admin/clusters/1.json
  def destroy
    @cluster.destroy
    respond_to do |format|
      format.html { redirect_to admin_clusters_url, notice: 'Cluster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cluster
      @cluster = Cluster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cluster_params
      params.require(:cluster).permit(:name, :title, :mutual, :description)
    end
end
