require 'test_helper'

class BattlesUserControllerTest < ActionController::TestCase
	context "#new" do
		context "when not logged in" do
			should "redirect to login page" do
				get :new
				assert_response :redirect
			end
		end
		context "when logged in" do
			setup do
				sign_in users(:scott)
			end

			should "get new and return success" do
				get :new
				assert_response :success
			end

			should "should set a flash error if the battle_id params is missing " do
				get :new, {}
				assert_equal "Battle required", flash[:error]
			end

			should "display the battles name" do
				get :new, battle_id: battles(:one).id
				assert_match /#{battles(:one).name}/, response.body
			end

			should "assing a new user battle relationship" do
				get :new, battle_id: battles(:one).id
				assert_equal battles(:one), assigns(:battles_user).battle
			end

			should "assing a new user battle relationship to the current user" do
				get :new, battle_id: battles(:one).id
				assert_equal users(:scott), assigns(:battles_user).user
			end

			should "return a 404 status if no battle is found" do
				get :new, battle_id: 'invalid'
				assert_response :not_found
			end
		end
	end
end
