class RoundMovesController < ApplicationController
  # GET /rounds/new
  # GET /rounds/new.json
  def new
    @roundmove = RoundMove.new

    respond_to do |format|
      format.js
      format.json { render json: @round }
    end
  end


    # POST /types
  # POST /types.json
  def create
    @roundmove = RoundMove.new(params[:round_move])

    respond_to do |format|
      if @roundmove.save
        format.html { redirect_to rounds_path, notice: 'Type was successfully created.' }
        format.json { render json: @roundmove, status: :created, location: @type }
      else
        format.html { render action: "new" }
        format.json { render json: @roundmove.errors, status: :unprocessable_entity }
      end
    end
  end
end
