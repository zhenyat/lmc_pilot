require 'test_helper'

class Admin::ClustersControllerTest < ActionController::TestCase
  setup do
    @cluster = clusters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clusters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cluster" do
    assert_difference('Cluster.count') do
      post :create, cluster: { description: @cluster.description, mutual: @cluster.mutual, name: @cluster.name, title: @cluster.title }
    end

    assert_redirected_to admin_cluster_path(assigns(:cluster))
  end

  test "should show cluster" do
    get :show, id: @cluster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cluster
    assert_response :success
  end

  test "should update cluster" do
    patch :update, id: @cluster, cluster: { description: @cluster.description, mutual: @cluster.mutual, name: @cluster.name, title: @cluster.title }
    assert_redirected_to admin_cluster_path(assigns(:cluster))
  end

  test "should destroy cluster" do
    assert_difference('Cluster.count', -1) do
      delete :destroy, id: @cluster
    end

    assert_redirected_to admin_clusters_path
  end
end
