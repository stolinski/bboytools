class ProfilesController < ApplicationController
	before_filter :authenticate_user!
  def show

  	@user = User.find_by_bboy_name(params[:id])

  	if @user
  		@moves = Move.limit(5).order("created_at DESC").find(:all, conditions: {user_id: @user.id})
  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end

  def time
  	render action: :time
  end
end
