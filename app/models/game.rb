class Game < ActiveRecord::Base
  has_many :pieces

  after_create :populate_board!

# Returns true/false if a coordinate contains a piece.
  def contains_piece?(x, y)
  # Determines if a piece is at given location.
    pieces.where(x_coordinate: x, y_coordinate: y, captured?: false).present?
  end

  def populate_board!
  # white pieces
    Rook.create(game_id: self.id, x_coordinate: 8, y_coordinate: 1, color: 'white')
    Rook.create(game_id: self.id, x_coordinate: 8, y_coordinate: 8, color: 'white')

    Knight.create(game_id: self.id, x_coordinate: 8, y_coordinate: 2, color: 'white')
    Knight.create(game_id: self.id, x_coordinate: 8, y_coordinate: 7, color: 'white')

    Bishop.create(game_id: self.id, x_coordinate: 8, y_coordinate: 3, color: 'white')
    Bishop.create(game_id: self.id, x_coordinate: 8, y_coordinate: 6, color: 'white')

    Queen.create(game_id: self.id, x_coordinate: 8, y_coordinate: 4, color: 'white')
    King.create(game_id: self.id, x_coordinate: 8, y_coordinate: 5, color: 'white')

    (1..8).each do |i|
      Pawn.create(game_id: self.id, x_coordinate: 7, y_coordinate: i, color: 'white')
    end  
    
  # black pieces
    Rook.create(game_id: self.id, x_coordinate: 1, y_coordinate: 1, color: 'black')
    Rook.create(game_id: self.id, x_coordinate: 1, y_coordinate: 8, color: 'black')

    Knight.create(game_id: self.id, x_coordinate: 1, y_coordinate: 2, color: 'black')
    Knight.create(game_id: self.id, x_coordinate: 1, y_coordinate: 7, color: 'black')

    Bishop.create(game_id: self.id, x_coordinate: 1, y_coordinate: 3, color: 'black')
    Bishop.create(game_id: self.id, x_coordinate: 1, y_coordinate: 6, color: 'black')

    Queen.create(game_id: self.id, x_coordinate: 1, y_coordinate: 4, color: 'black')
    King.create(game_id: self.id, x_coordinate: 1, y_coordinate: 5, color: 'black')

    (1..8).each do |i|
      Pawn.create(game_id: self.id, x_coordinate: 2, y_coordinate: i, color: 'black')
    end 
  end

end
