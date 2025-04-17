module ChessLogic
  module Piece
    class King < BasePiece
      def initialize(color:)
        super
        @symbol = @color == "white" ? "K" : "k"
      end

      def generateMoves(field:, board:)
        
      end
    end
  end
end