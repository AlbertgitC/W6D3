require_relative "piece"

class EmptyError < StandardError
end
class ColorError < StandardError
end
class InvalidMoveError < StandardError
end

class Board 



    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        self.build_board
    end

    def build_board
        (0..1).each do |row_idx|
            (0...rows.size).each do |col_idx|
                 add_piece(Piece.new(:black,self, [row_idx,col_idx]), [row_idx,col_idx])

            end
        end
        (6..7).each do |row_idx|
            (0...rows.size).each do |col_idx|
                 add_piece(Piece.new(:white,self, [row_idx,col_idx]), [row_idx,col_idx])
            end
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
        begin
            raise EmptyError if self[start_pos].nil? 
            raise InvalidMoveError if !valid_pos?(end_pos) 
            raise ColorError if self[end_pos].color == color
            if self[end_pos].nil? || self[end_pos].color != color
                self[start_pos].pos = end_pos
                self[end_pos] = self[start_pos]
                self[start_pos] = nil
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

    #@sentinel = nullpiece

end



# board = Board.new
# test = Piece.new(:white, board, [0,0])
# board.add_piece(test, test.pos)
# # board.move_piece(test.color, test.pos, [2,2])
# test2 = Piece.new(:black, board, [3,0])
# board.add_piece(test2, test2.pos)
# board.add_piece(test3, test3.pos)
# test3 = Piece.new(:black, board, [6,0])