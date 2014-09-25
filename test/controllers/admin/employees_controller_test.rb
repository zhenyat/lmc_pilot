require 'test_helper'

class Admin::EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { active: @employee.active, department_id: @employee.department_id, level_id: @employee.level_id, manager_id: @employee.manager_id, middle_name: @employee.middle_name, name: @employee.name, pin: @employee.pin, position_id: @employee.position_id, store_id: @employee.store_id, surname: @employee.surname }
    end

    assert_redirected_to admin_employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { active: @employee.active, department_id: @employee.department_id, level_id: @employee.level_id, manager_id: @employee.manager_id, middle_name: @employee.middle_name, name: @employee.name, pin: @employee.pin, position_id: @employee.position_id, store_id: @employee.store_id, surname: @employee.surname }
    assert_redirected_to admin_employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to admin_employees_path
  end
end
