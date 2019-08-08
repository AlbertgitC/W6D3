require_relative "stepable"
class King < Piece

    include Stepable

    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = :K 
        super(color, board, pos)
    end

    def move_diffs
        king_moves_arr = [
        [0, -1], [0, 1], [-1, 0], [1, 0], [-1, 1], [-1, -1], [1, 1], [1, -1]
        ]
    end

end