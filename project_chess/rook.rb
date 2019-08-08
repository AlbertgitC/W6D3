require_relative "slideable"
class Rook < Piece

    include Slideable 

    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = :R  
        super(color, board, pos)
    end

    def move_dirs
        horizontal_dirs 
    end

end