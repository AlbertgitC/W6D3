require_relative "slideable"
class Bishop < Piece

    include Slideable

    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = :B  
        super(color, board, pos)
    end

    def move_dirs
        diagonal_dirs 
    end


end