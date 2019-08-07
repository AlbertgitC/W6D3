class Piece

    attr_reader :board, :color 
    attr_accessor :pos

    def initialize(color, board, pos)
        @board = board
        @color = color 
        @pos = pos
    end



end