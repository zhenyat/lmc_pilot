class Admin::LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /admin/levels
  # GET /admin/levels.json
  def index
    @levels = Level.all
  end

  # GET /admin/levels/1
  # GET /admin/levels/1.json
  def show
  end

  # GET /admin/levels/new
  def new
    @level = Level.new
  end

  # GET /admin/levels/1/edit
  def edit
  end

  # POST /admin/levels
  # POST /admin/levels.json
  def create
    @level = Level.new(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to [:admin, @level], notice: 'Level was successfully created.' }
        format.json { render action: 'show', status: :created, location: @level }
      else
        format.html { render action: 'new' }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/levels/1
  # PATCH/PUT /admin/levels/1.json
  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to [:admin, @level], notice: 'Level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/levels/1
  # DELETE /admin/levels/1.json
  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to admin_levels_url, notice: 'Level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.require(:level).permit(:rank, :name, :title)
    end
end
