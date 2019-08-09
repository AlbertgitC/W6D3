require 'colorize'
require_relative 'cursor'
require_relative 'board'
require 'byebug'
class Display

    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        #board[cursor.cursor_pos].bg_gray
        board.rows.each do |row|
            # board[cursor.cursor_pos].symbol.to_s.bg_gray
            new_row = []
            row.each do |piece|
                if piece.pos == cursor.cursor_pos #piece.pos will be nil for nullpiece becuase it doesnt have a pos it will be nil
                    #we could check for nil and then assume its a null piece 
                    if piece.color == :black 
                        new_row << piece.symbol.to_s.colorize(:color => :blue, :background => :green)
                    elsif piece.color == :white 
                        new_row << piece.symbol.to_s.colorize(:color => :red, :background => :green)
                    else #fix this display on cursor, probably because NullPiece is only one instance. So all NullPiece.pos is the same 
                        new_row << piece.symbol.to_s.colorize(:color => :white, :background => :green)
                    end
                else
                    if piece.color == :black 
                        new_row << piece.symbol.to_s.blue
                    elsif piece.color == :white 
                        new_row << piece.symbol.to_s.red 
                    else 
                        new_row << piece.symbol
                    end
                end
            end
            puts new_row.join(" ")
            sleep(0.1)
            # print board[cursor.cursor_pos].symbol.to_s.bg_gray 
        end
    end

    def looper
        loop do 
            self.render #how do we render the square in cursor 
            cursor.get_input 
        end
            
    end

end


# class String
#     def bg_gray;        "\e[47m#{self}\e[0m" end
#     def bg_black;       "\e[40m#{self}\e[0m" end
# end

board = Board.new
display = Display.new(board)
#display.render 
display.looper 

#puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
