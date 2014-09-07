class Admin::DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /admin/departments
  # GET /admin/departments.json
  def index
    @departments = Department.all
  end

  # GET /admin/departments/1
  # GET /admin/departments/1.json
  def show
  end

  # GET /admin/departments/new
  def new
    @department = Department.new
  end

  # GET /admin/departments/1/edit
  def edit
  end

  # POST /admin/departments
  # POST /admin/departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to [:admin, @department], notice: 'Department was successfully created.' }
        format.json { render action: 'show', status: :created, location: @department }
      else
        format.html { render action: 'new' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/departments/1
  # PATCH/PUT /admin/departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to [:admin, @department], notice: 'Department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/departments/1
  # DELETE /admin/departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to admin_departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:number, :title)
    end
end
