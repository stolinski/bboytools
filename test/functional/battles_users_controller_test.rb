require 'test_helper'

class BattlesUsersControllerTest < ActionController::TestCase
  setup do
    @battles_user = battles_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battles_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battles_user" do
    assert_difference('BattlesUser.count') do
      post :create, battles_user: {  }
    end

    assert_redirected_to battles_user_path(assigns(:battles_user))
  end

  test "should show battles_user" do
    get :show, id: @battles_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battles_user
    assert_response :success
  end

  test "should update battles_user" do
    put :update, id: @battles_user, battles_user: {  }
    assert_redirected_to battles_user_path(assigns(:battles_user))
  end

  test "should destroy battles_user" do
    assert_difference('BattlesUser.count', -1) do
      delete :destroy, id: @battles_user
    end

    assert_redirected_to battles_users_path
  end
end
