class Queen < Piece

	def valid_move?(x,y)
		#move is valid if x_coordinate is equal to x or y_coordinate is equal to y
		x_coordinate == x || y_coordinate == y || 
		#or the diagonal x/y using absolute values
			(x_coordinate - x).abs == (y_coordinate - y).abs
	end

end
