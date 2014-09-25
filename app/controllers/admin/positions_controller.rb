class Admin::PositionsController < ApplicationController
  layout 'admin'
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  # GET /admin/positions
  # GET /admin/positions.json
  def index
    @positions = Position.all
  end

  # GET /admin/positions/1
  # GET /admin/positions/1.json
  def show
  end

  # GET /admin/positions/new
  def new
    @position = Position.new
  end

  # GET /admin/positions/1/edit
  def edit
  end

  # POST /admin/positions
  # POST /admin/positions.json
  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to [:admin, @position], notice: 'Position was successfully created.' }
        format.json { render action: 'show', status: :created, location: @position }
      else
        format.html { render action: 'new' }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/positions/1
  # PATCH/PUT /admin/positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to [:admin, @position], notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/positions/1
  # DELETE /admin/positions/1.json
  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to admin_positions_url, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      params.require(:position).permit(:name, :title)
    end
end
