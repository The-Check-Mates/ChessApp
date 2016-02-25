require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  GamesControllerTest

  def setup
    @player = players(:player_1)
    @game = games(:one)
  end
   
  test "chess board should be wrapped by one parent div" do
  get :show
  assert_select 'div#chessboard', count: 1
  end
   
  test "chess board should contain 8 rows of spaces" do
  get :show
  assert_select 'div.board-row', count: 8
  end
   
  test "chess board should contain 64 individual spaces" do
  sign_in @player
  get :show
  assert_select 'div.chessboard-space', count: 64
  end
   
  test "each chess board space should be associated with a coordinate" do
  sign_in @player
  get :show, id: @game
   
    (1..8).each do |x|
      (1..8).each do |y|
      assert_select "div##{x}#{y}", count: 1
      end
    end
  end
end


