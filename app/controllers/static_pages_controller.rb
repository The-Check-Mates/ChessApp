class StaticPagesController < ApplicationController
	
	def index
		@open_games = open_games
	end
	
	def open_games
    if player_signed_in?
      @open_games = Game.where(black_player_id: nil).where.not(white_player_id: current_player.id).first(10)
    end
  end

end
