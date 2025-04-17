module ChessLogic
  module Piece
    class Queen < BasePiece
      def initialize(color:)
        super
        @symbol = @color == "white" ? "Q" : "q"
      end

      def generateMoves(field:, board:)
        
      end
    end
  end
end