class Piece

    attr_reader :board, :color 
    attr_accessor :pos

    def initialize(color, board, pos)
        @board = board
        @color = color 
        @pos = pos
    end

    def to_s

    end

    def empty?

    end

    def valid_moves

    end

    def symbol
        
    end


    private

    def move_into_check?(end_pos)

    end

end
