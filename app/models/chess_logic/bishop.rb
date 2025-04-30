module ChessLogic
  class Bishop < Piece
    def initialize(color:)
      super
      @symbol = @color == "white" ? "B" : "b"
    end

    def generateMoves(field:, board:)
      moves = []
      directions = DIRECTIONS
      ray_directions = [directions[:rightUp], directions[:rightDown], directions[:leftDown], directions[:leftUp]]
      ray_directions.each do |direction|
        moves.concat self.generateRayMoves(field: field, board: board, direction: direction)
      end
      moves
    end
  end
end