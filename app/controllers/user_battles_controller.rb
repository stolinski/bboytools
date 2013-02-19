class UserBattlesController < ApplicationController
  # GET /user_battles
  # GET /user_battles.json
  def index
    @user_battles = UserBattle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_battles }
    end
  end

  # GET /user_battles/1
  # GET /user_battles/1.json
  def show
    @user_battle = UserBattle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_battle }
    end
  end

  # GET /user_battles/new
  # GET /user_battles/new.json
  def new
    @user_battle = UserBattle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_battle }
    end
  end

  # GET /user_battles/1/edit
  def edit
    @user_battle = UserBattle.find(params[:id])
  end

  # POST /user_battles
  # POST /user_battles.json
  def create
    @user_battle = UserBattle.new(params[:user_battle])
    @user_battle.user_id = current_user.id
    respond_to do |format|
      if @user_battle.save
        format.html { redirect_to @user_battle, notice: 'User battle was successfully created.' }
        format.json { render json: @user_battle, status: :created, location: @user_battle }
      else
        format.html { render action: "new" }
        format.json { render json: @user_battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_battles/1
  # PUT /user_battles/1.json
  def update
    @user_battle = UserBattle.find(params[:id])

    respond_to do |format|
      if @user_battle.update_attributes(params[:user_battle])
        format.html { redirect_to @user_battle, notice: 'User battle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_battles/1
  # DELETE /user_battles/1.json
  def destroy
    @user_battle = UserBattle.find(params[:id])
    @user_battle.destroy

    respond_to do |format|
      format.html { redirect_to user_battles_url }
      format.json { head :no_content }
    end
  end
end
