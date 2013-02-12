class ProfilesController < ApplicationController
	before_filter :authenticate_user!, except: [:time, :users]
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

  def bmode
    @power = current_user.moves.power
    @footwork = current_user.moves.footwork
    @freezes = current_user.moves.freezes
    @tops = current_user.moves.toprock
    respond_to do |format|
      format.html # index.html.erb
    end
  end


  def users
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
