require_relative "pieces"
require "colorize"
require "byebug"

class EmptyError < StandardError
end
class ColorError < StandardError
end
class InvalidMoveError < StandardError
end

class Board 

    attr_reader :rows

    def initialize
        @sentinel = NullPiece.instance
        @rows = Array.new(8) {Array.new(8, sentinel)}
        self.build_board
    end

    def build_board
        #add pawns
        (0...rows.size).each do |col_idx|
            add_piece(Pawn.new(:black, self, [1,col_idx]), [1,col_idx])
        end
        (0...rows.size).each do |col_idx|
            add_piece(Pawn.new(:white, self, [6,col_idx]), [6,col_idx])
        end
        #add rooks
        add_piece(Rook.new(:black, self, [0,0]), [0,0])
        add_piece(Rook.new(:black, self, [0,7]), [0,7])
        add_piece(Rook.new(:white, self, [7,0]), [7,0])
        add_piece(Rook.new(:white, self, [7,7]), [7,7])

        #add knights 
        add_piece(Knight.new(:black, self, [0,1]), [0,1])
        add_piece(Knight.new(:black, self, [0,6]), [0,6])
        add_piece(Knight.new(:white, self, [7,1]), [7,1])
        add_piece(Knight.new(:white, self, [7,6]), [7,6])

        #add bishops 
        add_piece(Bishop.new(:black, self, [0,2]), [0,2])
        add_piece(Bishop.new(:black, self, [0,5]), [0,5])
        add_piece(Bishop.new(:white, self, [7,2]), [7,2])
        add_piece(Bishop.new(:white, self, [7,5]), [7,5])

        #add kings 
        add_piece(King.new(:black, self, [0,4]), [0,4])
        add_piece(King.new(:white, self, [7,4]), [7,4])
        #add queens
        add_piece(Queen.new(:black, self, [0,3]), [0,3])
        add_piece(Queen.new(:white, self, [7,3]), [7,3])

     
    end

    def render
        self.rows.each do |row|
            new_row = []
            row.each do |piece|
                if piece.color == :black 
                    new_row << piece.symbol.to_s.blue
                elsif piece.color == :white 
                    new_row << piece.symbol.to_s.red 
                else 
                    new_row << piece.symbol
                end
            end
            print new_row.join(" ")
            puts 
        end
    end

    def [](pos)
        row, col = pos[0], pos[1]
        rows[row][col]
    end

    def []=(pos, val)
        row, col = pos[0], pos[1]
        rows[row][col] = val 
    end

    def move_piece(color, start_pos, end_pos)
        test_piece = self[start_pos]
        move_arr = test_piece.moves 
        begin
            raise EmptyError if self[start_pos] == sentinel 
            raise InvalidMoveError if !valid_pos?(end_pos) || !move_arr.include?(end_pos)
            raise ColorError if self[end_pos].color == color
            if self[end_pos].is_a?(NullPiece) || self[end_pos].color != color
                self[start_pos].pos = end_pos
                self[end_pos] = self[start_pos]
                self[start_pos] = sentinel
            end
        rescue EmptyError
            puts "No piece at the start position"
        rescue InvalidMoveError
            puts "Not a valid move"
        rescue ColorError
            puts "The piece in that square is yours"
        end
    end

    def valid_pos?(pos)
        return false if !pos[0].between?(0,7) || !pos[1].between?(0,7)
        
        true 
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end

    def pieces

    end

    def dup

    end

    def move_piece!(color, start_pos, end_pos)

    end



    private 

    attr_reader :sentinel

end



# board = Board.new
# test = Piece.new(:white, board, [0,0])
# board.add_piece(test, test.pos)
# # board.move_piece(test.color, test.pos, [2,2])
# test2 = Piece.new(:black, board, [3,0])
# board.add_piece(test2, test2.pos)
# board.add_piece(test3, test3.pos)
# test3 = Piece.new(:black, board, [6,0])
#board.move_piece(:black, [0,1], [2,2])
#board.move_piece(:black, [0,0], [0,1])