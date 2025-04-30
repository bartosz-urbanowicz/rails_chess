module ChessLogic
  class Queen < Piece
    def initialize(color:)
      super
      @symbol = @color == "white" ? "Q" : "q"
    end

    def generateMoves(field:, board:)
      moves = []
      directions = ChessLogic::Piece::DIRECTIONS
      ray_directions = [
        directions[:rightUp], 
        directions[:rightDown], 
        directions[:leftDown],
        directions[:leftUp],
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