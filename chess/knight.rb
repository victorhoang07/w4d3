require_relative 'piece.rb'
require_relative 'stepable.rb'
class Knight < Piece

    include Stepable
    @@name = "Knight"
    
    def inspect
        @@name
    end

end
