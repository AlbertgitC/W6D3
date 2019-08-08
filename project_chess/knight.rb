require_relative "stepable"
require_relative "piece"

class Knight < Piece

    include Stepable

    
    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = :N 
        super(color, board, pos)
    end

    def move_diffs
        knight_moves_arr = [
        [1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]
        ]
    end

end