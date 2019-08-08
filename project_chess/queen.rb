require_relative "slideable"
class Queen < Piece

    include Slideable 

    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = :Q 
        super(color, board, pos)
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end

end