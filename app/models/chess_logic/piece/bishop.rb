module ChessLogic
  module Piece
    class Bishop < BasePiece
      def initialize(color:)
        super
        @symbol = @color == "white" ? "B" : "b"
      end

      def generateMoves(field:, board:)
        
      end
    end
  end
end