require "singleton"
class NullPiece < Piece

    include Singleton 
    attr_reader :symbol, :color

    def initialize
        @symbol = :_
        @color = :nothing
        #super(color,"x","x")
    end

    def moves
        puts "This is a null piece"
    end

end
