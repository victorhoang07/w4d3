# require_relative 'board.rb'

class Piece
    attr_reader :color, :board
    attr_accessor :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end
    


end

# p b = Piece.new

