class ProfilesController < ApplicationController
	before_filter :authenticate_user!, except: :time
  def show

  	@user = User.find_by_bboy_name(params[:id])

  	if @user
  		@moves = current_user.moves.limit(5)
  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end

  def time
  	render action: :time
  end
end
