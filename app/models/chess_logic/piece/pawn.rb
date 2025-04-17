require_relative("piece.rb")

module ChessLogic
  module Piece
    class Pawn < BasePiece
      def initialize(color:)
        super
        @symbol = @color == "white" ? "P" : "p"
      end

      def generateMoves(field:, board:)
        endField = self.color == "white" ? field + DIRECTIONS[:up] : field + DIRECTIONS[:down]
        [ ChessLogic::Move.new(startField: field, endField: endField) ]
      end
    end
  end
end