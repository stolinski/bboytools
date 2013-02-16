class MovesController < ApplicationController
	before_filter :authenticate_user!
  # GET /moves
  # GET /moves.json
  def index
  	@moves = current_user.moves
  							.joins(:type)
  							.order('types.row_order')
  							.all
  	@allmoves = current_user.moves.all
  	@moves_list = @allmoves.group_by { |t| t.type }

  	respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /moves/1
  # GET /moves/1.json
  def show
  	@move = get_move(params[:id])

  	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @move }
    end
  end

  # GET /moves/new
  # GET /moves/new.json
  def new
  	@move = Move.new

  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @move }
    end
  end

  # GET /moves/1/edit
  def edit
  	@move = get_move(params[:id])
  end

  # POST /moves
  # POST /moves.json


  def create
  	@move = current_user.moves.new(params[:move])
  	respond_to do |format|
  		if @move.save
  			format.html { redirect_to moves_path, notice: 'Move was successfully created.' }
  			format.json { render json: @move, status: :created, location: @move }
  		else
  			format.html { render action: "new" }
  			format.json { render json: @move.errors, status: :unprocessable_entity }
  		end
  	end
  end

  # PUT /moves/1
  # PUT /moves/1.json
  def update
  	@move = get_move(params[:id])

  	respond_to do |format|
  		if @move.update_attributes(params[:move])
  			format.html { redirect_to moves_path, notice: 'Move was successfully updated.' }
  			format.js
  			format.json { head :no_content }
  		else
  			format.html { render action: "edit" }
  			format.js
  			format.json { render json: @move.errors, status: :unprocessable_entity }
  		end
  	end
  end

  # DELETE /moves/1
  # DELETE /moves/1.json
  def destroy
  	@move = get_move(params[:id])
  	@move.destroy

  	respond_to do |format|
  		format.html { redirect_to moves_url }
  		format.json { head :no_content }
  	end
  end


  private
  def get_move(move_id)
  	Move.find(move_id)
  end
end


