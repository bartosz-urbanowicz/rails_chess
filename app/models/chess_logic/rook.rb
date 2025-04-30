module ChessLogic
  class Rook < Piece
    def initialize(color:)
      super
      @symbol = @color == "white" ? "R" : "r"
    end

    def generateMoves(field:, board:)
      moves = []
      directions = DIRECTIONS
      ray_directions = [
        directions[:up], 
        directions[:right], 
        directions[:left],
        directions[:down],
      ]
      ray_directions.each do |direction|
        moves.concat self.generateRayMoves(field: field, board: board, direction: direction)
      end
      moves
    end
  end
end