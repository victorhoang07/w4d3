require_relative 'piece.rb'

class Pawn < Piece

    @@name = "Pawn"
    
  
    def inspect
        @@name
    end

    def moves
        possible_pos = []
        row, col = self.pos
        if at_start_row? && self.color == :white && @board[[row-2,col]] == nil
            possible_pos << [row-2,col]
        elsif at_start_row? && self.color == :black && @board[[row+2,col]] == nil
            possible_pos << [row+2, col]
        end
        possible_pos << forward_steps
        possible_pos << side_attacks

        possible_pos

    end

    private

    def at_start_row?
        i = self.color == :white ? 6 : 1
        self.pos[0] == i
    end

    

    def forward_steps
        row, col = self.pos
        if self.color == :white && @board[[row-1,col]] == nil
            return [row-1, col]
        elsif self.color == :black && @board[[row+1,col]] == nil
            return [row+1, col] 
        end
    end

    def side_attacks
        row, col = self.pos
        possible_pos = []
        if self.color == :white && @board[[row-1, col+1]].color == :black && @board[[row-1, col+1]].is_a?(Piece)
            possible_pos << [row-1, col+1]
        end
        if self.color == :white && @board[[row-1, col-1]].color == :black && @board[[row-1, col-1]].is_a?(Piece)
            possible_pos << [row-1, col-1]
        end
        if self.color == :black && @board[[row+1, col-1]].color == :white && @board[[row+1, col-1]].is_a?(Piece)
            possible_pos << [row+1, col-1]
        end
        if self.color == :black && @board[[row+1, col+1]].color == :white && @board[[row+1, col+1]].is_a?(Piece)
            possible_pos << [row+1, col+1]
        end
        possible_pos
    end
end