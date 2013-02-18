class BattlesUserController < ApplicationController
	before_filter :authenticate_user!, only: [:new]
	def new
		if params[:battle_id]
			@battle = Battle.find(params[:battle_id])
			@battles_user = current_user.battles_users.new(battle: @battle)
		else
			flash[:error] = "Battle required"
		end
	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end
end
