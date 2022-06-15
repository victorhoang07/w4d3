require_relative 'piece.rb'
require_relative 'slideable.rb'

class Rook < Piece

    include Slideable
    @@name = "Rook"
    
    def inspect
        @@name
    end
    
    def move_dirs
        self.horizontal_dirs # ==> HORITONAL
    end
    
end


# r = Rook.new(:white, )

# r.test