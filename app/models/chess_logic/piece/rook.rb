module ChessLogic
  module Piece
    class Rook < BasePiece
      def initialize(color:)
        super
        @symbol = @color == "white" ? "R" : "r"
      end

      def generateMoves(field:, board:)
        
      end
    end
  end
end