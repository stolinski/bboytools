require 'test_helper'

class UserBattlesControllerTest < ActionController::TestCase
  setup do
    @user_battle = user_battles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_battles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_battle" do
    assert_difference('UserBattle.count') do
      post :create, user_battle: { battle_id: @user_battle.battle_id, notes: @user_battle.notes, user_id: @user_battle.user_id }
    end

    assert_redirected_to user_battle_path(assigns(:user_battle))
  end

  test "should show user_battle" do
    get :show, id: @user_battle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_battle
    assert_response :success
  end

  test "should update user_battle" do
    put :update, id: @user_battle, user_battle: { battle_id: @user_battle.battle_id, notes: @user_battle.notes, user_id: @user_battle.user_id }
    assert_redirected_to user_battle_path(assigns(:user_battle))
  end

  test "should destroy user_battle" do
    assert_difference('UserBattle.count', -1) do
      delete :destroy, id: @user_battle
    end

    assert_redirected_to user_battles_path
  end
end
