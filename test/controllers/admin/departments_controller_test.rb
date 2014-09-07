require 'test_helper'

class Admin::DepartmentsControllerTest < ActionController::TestCase
  setup do
    @department = departments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create department" do
    assert_difference('Department.count') do
      post :create, department: { number: @department.number, title: @department.title }
    end

    assert_redirected_to admin_department_path(assigns(:department))
  end

  test "should show department" do
    get :show, id: @department
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @department
    assert_response :success
  end

  test "should update department" do
    patch :update, id: @department, department: { number: @department.number, title: @department.title }
    assert_redirected_to admin_department_path(assigns(:department))
  end

  test "should destroy department" do
    assert_difference('Department.count', -1) do
      delete :destroy, id: @department
    end

    assert_redirected_to admin_departments_path
  end
end
