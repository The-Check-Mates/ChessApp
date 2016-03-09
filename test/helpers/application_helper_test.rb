require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  def setup
    @player_1 = players(:player_1)
    @player_2 = players(:player_2)
  end

  test 'Should return Player email' do
    assert_equal 'player1@test.com', player_email(@player_1), 'Should return "player1@test.com"'
    assert_equal 'player2@test.com', player_email(@player_2), 'Should return "player2@test.com"'
  end
end