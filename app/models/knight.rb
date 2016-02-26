class Knight < Piece
  
  def valid_move?(x, y)
  # for eight possible L-shape moves
    ( (x_coordinate - x).abs == 2 && (y_coordinate - y).abs == 1 ) ||
    ( (y_coordinate - y).abs == 2 && (x_coordinate - x).abs == 1 ) && !is_obstructed?
  end
  
end
