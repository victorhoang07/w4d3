require_relative "piece.rb"


class Bishop < Piece
    include Slideable
    @@name = "Bishop"
    

    def inspect
        @@name
    end
    
    def move_dirs
        self.diagonal_dirs # ==> HORITONAL
    end

end
