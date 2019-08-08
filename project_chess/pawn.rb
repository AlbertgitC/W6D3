class Pawn < Piece
#havent made actual move yet 
    attr_reader :symbol

    def initialize(color, board, pos)
        @symbol = :P 
        super(color, board, pos)
    end

    def move_dirs
        dir = self.forward_dir
        [dir, 0]
    end

    private 

    def at_start_row?
        return true if self.color == :black && self.pos[0] == 1 
        return true if self.color == :white && self.pos[0] == 6 
        false 
    end

    def forward_dir 
        if self.color == :black  
            return 1 
        else
            return -1
        end
    end

    def forward_steps
        return 2 if self.at_start_row?
        return 1
    end

    def side_attacks
        new_y = forward_dir      
        diagonal_left = [(self.pos[0] + new_y), (self.pos[1] + 1)]
        diagonal_right = [(self.pos[0] + new_y), (self.pos[1] - 1)]
        if self.color != board[diagonal_left].color
            board[self.pos] = nil
            self.pos = diagonal_left
            board[diagonal_left] = self
        elsif self.color != board[diagonal_right].color
            board[self.pos] = nil
            self.pos = diagonal_right
            board[diagonal_right] = self
        else
            puts "No valid Pawn attack"
        end


    end

end