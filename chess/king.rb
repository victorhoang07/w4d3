require_relative 'piece.rb'
require_relative 'stepable.rb'


class King < Piece
    @@name = "King"
include Stepable
    # def symbol
    # '♚'
    # end
  

    def inspect
        @@name
    end

end