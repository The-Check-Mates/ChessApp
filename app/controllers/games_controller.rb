class GamesController < ApplicationController
	
	helper_method :game

  def new
  	@game = Game.new
  	create
  end

  def create
    @game.save
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    @pieces = @game.pieces
  end

end
