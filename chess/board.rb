require_relative 'piece.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'knight.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'
require 'byebug'

class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) {Array.new(8, nil)}
        place_pieces
    end

    def place_pieces
    
        %i(white black).each do |color|
            fill_back_row(color)
            fill_pawns(color)
        end

    end

    def fill_back_row(color)
        back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

        i = color == :white ? 7 : 0

        back_pieces.each.with_index do |piece, j|
            self[[i,j]] = piece.new(color, self, [i, j])
        end
    end

    def fill_pawns(color)
        i = color == :white ? 6 : 1

        (0..7).to_a.each do |j|
            self[[i,j]] = Pawn.new(color, self, [i,j])
        end

    end


    def [](pos)
        row = pos[0] 
        col = pos[1]
        @rows[row][col]
    end

    def []=(pos, value)
        row = pos[0]
        col = pos[1]
        @rows[row][col] = value
    end


    def move_piece(start_pos, end_pos)
        # debugger
        if self[start_pos] == nil #|| self[end_pos] != nil
          raise "Invalid position"
        end

        moving_piece = self[start_pos]
        self[start_pos] = nil
        moving_piece.pos = end_pos
        self[end_pos] = moving_piece
    end


end

p b = Board.new
# p b.move_piece([0,4], [3,3])
# # p b.rows
# p b.move_piece([0,5], [3,2])
p b.rows
p b[[1,1]].moves




