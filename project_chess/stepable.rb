module Stepable

    def moves
        #debugger 
        possible_moves = []
        self.move_diffs.each do |move|
            new_x = self.pos[1] + move[1] 
            new_y = self.pos[0] + move[0]
            new_pos = [new_y, new_x]
            unless !self.board.valid_pos?(new_pos) || self.board[new_pos].color == self.color
                possible_moves << new_pos
            end
        end
        possible_moves
    end
    
    private

    def move_diffs #array of moves 
         king_moves_arr = [
        [0, -1], [0, 1], [-1, 0], [1, 0], [-1, 1], [-1, -1], [1, 1], [1, -1]
        ]

         knight_moves_arr = [
        [1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]
        ]
    end

end