require 'test_helper'

class Admin::ActioncardsControllerTest < ActionController::TestCase
  setup do
    @actioncard = actioncards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actioncards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actioncard" do
    assert_difference('Actioncard.count') do
      post :create, actioncard: { competency_id: @actioncard.competency_id, content: @actioncard.content, level_id: @actioncard.level_id }
    end

    assert_redirected_to admin_actioncard_path(assigns(:actioncard))
  end

  test "should show actioncard" do
    get :show, id: @actioncard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actioncard
    assert_response :success
  end

  test "should update actioncard" do
    patch :update, id: @actioncard, actioncard: { competency_id: @actioncard.competency_id, content: @actioncard.content, level_id: @actioncard.level_id }
    assert_redirected_to admin_actioncard_path(assigns(:actioncard))
  end

  test "should destroy actioncard" do
    assert_difference('Actioncard.count', -1) do
      delete :destroy, id: @actioncard
    end

    assert_redirected_to admin_actioncards_path
  end
end
