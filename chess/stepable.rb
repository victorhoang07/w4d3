
module Stepable

    KNIGHT_MOVES_SET = [
    [2,1],
    [2, -1],
    [-2, 1],
    [-2, -1],
    [1, 2],
    [-1, 2],
    [1, -2],
    [-1, -2]
    ].freeze

    KING_MOVES_SET = [
    [0, -1], #left
    [0, 1], #right
    [-1, 0], #up
    [1, 0], #down
    [-1, -1], #up, left
    [-1, 1], #up, right
    [1, -1], #down, left
    [1, 1] #down, right
    ].freeze

    def moves
        possible_pos = []
        row, col = self.pos
        on_board = (0..7).to_a
        if self.king_moves == KING_MOVES_SET
            KING_MOVES_SET.each do |direction| #[0, -1]
                row_increment = row + direction[0]
                col_increment = col + direction[1]
                 position = [row_increment,col_increment]
                if @board[position] == nil && on_board.include?(row_increment) && on_board.include?(col_increment)
                    possible_pos << position
                elsif @board[position].is_a?(Piece) && @board[position].color != self.color
                    possible_pos << position
                end
            end
        else 
            KNIGHT_MOVES_SET.each do |direction| #[0, -1]
                row_increment = row + direction[0]
                col_increment = col + direction[1]
                position = [row_increment,col_increment]
                if @board[position] == nil && on_board.include?(row_increment) && on_board.include?(col_increment) 
                    possible_pos << position
                elsif @board[position].is_a?(Piece) && @board[position].color != self.color
                    possible_pos << position
                end
            end
        end
        possible_pos
    end

    def king_moves
        KING_MOVES_SET
    end
    
     def knight_moves 
        KNIGHT_MOVES_SET
    end
    

    # def move_diffs
    #     raise NotImplementedError
    # end


    # private





end