class ProfilesController < ApplicationController
	before_filter :authenticate_user!, except: [:time, :home]
  def show
  	@user = User.find_by_bboy_name(params[:id])

  	if @user
  		@moves = current_user.moves
      							.joins(:type)
      							.limit(5)
  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end

  def time
  	render action: :time
  end

  def home
    @home = true
    render action: :home
  end

  def bmode
    @moves = current_user.moves
                .joins(:type)
                .order('types.row_order')
                .all
    respond_to do |format|
      format.html # index.html.erb
    end
  end


  def callout
    @moves = current_user.moves
                .joins(:type)
                .all
                # .order('types.row_order')
                # .all
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

  def roundgen
    numOfRounds = params[:rounds]

    @rounds = []
    @tops = current_user.moves.toprock.withlevel
    @godown = current_user.moves.godown.withlevel
    @footwork = current_user.moves.footwork.withlevel
    @power = current_user.moves.power.withlevel


    # @tops.shift
    # Initializes buckets with a starting value of 0
    b = []
    numOfRounds.to_i.times do
      b.push([0])
    end

    # b = [[0],[0],[0],[0]]

    [@tops, @godown, @footwork, @power].each do |type|
      #  Gets moves in increasing value order
      type.sort_by! { |k| k.level || 0 }.reverse!
  
      r = 0
      # While there are still moves in M
      while type.length > 0
        i = 0
        #  For each bucket add a cycle of moves
        b.each do
          unless type[0].nil?
            b[i][0] += type[0].level
            b[i].push(type.shift)
          end
          i += 1
        end
      
        # Order and revers after cycle to prepare 2nd rounds of pushes
        type.sort_by! { |k| k.level || 0 }.reverse!
        b.sort! {|x,y| x[0] <=> y[0]}
        r += 1
        if r > 20
          type.shift
        end
      end

    end

    @rounds = b
  end
end
