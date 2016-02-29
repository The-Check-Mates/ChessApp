require 'test_helper'

class GamesControllerTest < ActionController::TestCase
	
	def setup
		@player_1 = players(:player_1)
		@game = games(:one)
	end
	
	test "should get new" do
		sign_in @player_1
		get :new
		assert_response :success
		assert_template 'games/new'
	end

	test "should create a new game object" do
		sign_in @player_1
		get :new, { white_player_id: @player_1.id }
		game = assigns(:game)
		assert game.new_record?
		assert_response :success
	end

	test "should create a game that persists and redirects to show" do
		player_2 = players(:player_2)
		sign_in player_2

		params = { 
			game: {
				white_player_id: player_2.id,
      	black_player_id: nil
			}
		}

		post :create, params
		game = assigns(:game)
		assert game.persisted?
		assert_redirected_to game
	end

  test "chess board should be wrapped by one parent div" do
    sign_in @player_1
    get :show, id: @game
    assert_template 'games/show'
    assert_select 'div#chessboard', count: 1
  end
   
  test "chess board should contain 8 rows of spaces" do
    sign_in @player_1
    get :show, id: @game
    assert_select 'div.board-row', count: 8
  end
   
  test "chess board should contain 64 individual spaces" do
    sign_in @player_1
    get :show, id: @game
    assert_select 'div.chessboard-space', count: 64
  end

end
