require_relative 'piece.rb'
require_relative 'slideable.rb'

class Queen < Piece
    include Slideable
    @@name = "Queen"

    def inspect
        @@name
    end
    
    def move_dirs
        [self.horizontal_dirs, self.horizontal_dirs] # ==> HORITONAL
    end

    

end

# p Piece.new

