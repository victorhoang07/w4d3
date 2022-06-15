module Slideable

    HORIZONTAL = [
     [0, -1], #left
     [0, 1], #right
     [-1, 0], #up
     [1, 0] #down
    ].freeze
    # def moves

    DIAGONAL = [
    [-1, -1], #up, left
    [-1, 1], #up, right
    [1, -1], #down, left
    [1, 1] #down, right
    ].freeze

    def horizontal_dirs
        HORIZONTAL
    end

    def diagonal_dirs
        DIAGONAL
    end

    def moves
        possible_pos = []
        if self.move_dirs == HORIZONTAL
           HORIZONTAL.each do |direction|
            possible_pos += grow_unblocked_moves_in_dir(direction[0], direction[1])
           end
        elsif self.move_dirs == DIAGONAL
            DIAGONAL.each do |direction|
            possible_pos += grow_unblocked_moves_in_dir(direction[0], direction[1])
            end
        else
            DIAGONAL.each do |direction|
            possible_pos += grow_unblocked_moves_in_dir(direction[0], direction[1])
            end
            HORIZONTAL.each do |direction|
            possible_pos += grow_unblocked_moves_in_dir(direction[0], direction[1])
           end
        end
        possible_pos
    end

    private
    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy) # [0, -1]
        # debugger
        all_moves_in_dir = [] #[3,2]
        index = (0..7).to_a
        row, col = self.pos # [3,3]
                    #[3,2]
        until @board[[row+dx,col+dy]] != nil || !(index.include?(row) && index.include?(col))
            row += dx # 3
            col += dy # 1
            if @board[[row,col]] == nil 
                all_moves_in_dir << [row, col]
            elsif @board[[row,col]].color != self.color
                all_moves_in_dir << [row, col]
            end
        end

        all_moves_in_dir #[[3,2]]
    end

end

