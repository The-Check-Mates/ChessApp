require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  GamesControllerTest
  test "should get new" do
  get :new
  assert_response :success
  assert_template 'games/new'
  end
   
  test "chess board should be wrapped by one parent div" do
  get :new
  assert_select 'div#chessboard', count: 1
  end
   
  test "chess board should contain 8 rows of spaces" do
  get :new
  assert_select 'div.board-row', count: 8
  end
   
  test "chess board should contain 64 individual spaces" do
  get :new
  assert_select 'div.chessboard-space', count: 64
  end
   
  test "each chess board space should be associated with a coordinate" do
  get :new
   
  (1..8).each do |letter|
  (1..8).each do |number|
  assert_select "div##{letter}#{number}", count: 1
  end
  end
  end
end
