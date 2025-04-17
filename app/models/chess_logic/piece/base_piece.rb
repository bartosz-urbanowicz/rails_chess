module ChessLogic
  module Piece
    class BasePiece
      attr_reader :color, :symbol

      def initialize(color:)
        @color = color
      end
    end
  end
end