require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
	test "should get show" do
		get :show, id: users(:scott).bboy_name
		assert_response :success
		assert_template 'profiles/show'
	end
	test "should render a 404 for not found profild" do
		get :show, id: "does't exsits"
		assert_response :not_found
	end

	test "that variables are assinged on profile view" do
		get :show, id: users(:scott).bboy_name
		assert assigns(:user)
		assert_not_empty assigns(:moves)

	end


end
