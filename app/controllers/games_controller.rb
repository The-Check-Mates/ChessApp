class GamesController < ApplicationController
<<<<<<< HEAD
	
=======
	before_action :authenticate_player!
>>>>>>> a6c4d5012c24a5c15c37fb2bc8daeb05fb72269e
	helper_method :game

  def new
  	@game = Game.new
<<<<<<< HEAD
  	create
  end

  def create
    @game.save
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    @pieces = @game.pieces
=======
  end

  def create
    @game = Game.create(game_params)
    redirect_to game_path(@game)
  end

  def show
  end

  private

  def game
    @game ||= Game.where(id: params[:id]).last
  end

  def game_params
    params.require(:game).permit(
      :white_player_id,
      :black_player_id)
>>>>>>> a6c4d5012c24a5c15c37fb2bc8daeb05fb72269e
  end

end
