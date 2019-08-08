module Slideable

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves #continure in a direction, generate all possible move spaces 
        possible_moves_hash = { left: [0, -1], right: [0, 1], up: [-1, 0], down: [1, 0], 
        up_right: [-1, 1], up_left: [-1, -1], down_right: [1, 1], down_left: [1, -1] }

        possible_spaces = []

        self.move_dirs.each do |dir| 
            dy = possible_moves_hash[dir][0] #maybe an error with this access 
            dx = possible_moves_hash[dir][1]
            possible_spaces += grow_unblocked_moves_in_dir(dy, dx)
        end
        possible_spaces
    end

    private

    HORIZONTAL_DIRS = [:left, :right, :up, :down]
    DIAGONAL_DIRS = [:up_right, :up_left, :down_right, :down_left]

    def move_dirs #overwirtten later 
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end

    def grow_unblocked_moves_in_dir(dy, dx) #iterate unitil check is hit 
        # debugger 
        possible_spaces = []
        horz_step = self.pos[1] + dx 
        vert_step = self.pos[0] + dy
        new_pos = [vert_step, horz_step]
        #doesn't acount for going through enemy pieces 
        until !self.board.valid_pos?([vert_step, horz_step]) || self.board[[vert_step, horz_step]].color == self.color
            new_pos = [vert_step, horz_step]
            if self.board[new_pos].color == :white
                possible_spaces << new_pos
                return possible_spaces
            else
                possible_spaces << new_pos
            end
            horz_step += dx
            vert_step += dy 
        end
        possible_spaces
    end

end