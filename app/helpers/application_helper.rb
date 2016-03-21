module ApplicationHelper
	def player_email(player_id)
    player = Player.find(player_id)
    player.email
  end
end
