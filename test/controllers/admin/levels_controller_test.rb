require 'test_helper'

class Admin::LevelsControllerTest < ActionController::TestCase
  setup do
    @level = levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create level" do
    assert_difference('Level.count') do
      post :create, level: { name: @level.name, rank: @level.rank, title: @level.title }
    end

    assert_redirected_to admin_level_path(assigns(:level))
  end

  test "should show level" do
    get :show, id: @level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @level
    assert_response :success
  end

  test "should update level" do
    patch :update, id: @level, level: { name: @level.name, rank: @level.rank, title: @level.title }
    assert_redirected_to admin_level_path(assigns(:level))
  end

  test "should destroy level" do
    assert_difference('Level.count', -1) do
      delete :destroy, id: @level
    end

    assert_redirected_to admin_levels_path
  end
end
