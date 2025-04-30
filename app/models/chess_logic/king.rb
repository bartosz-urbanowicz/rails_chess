module ChessLogic
  class King < Piece
    def initialize(color:)
      super
      @symbol = @color == "white" ? "K" : "k"
    end

    def generateMoves(field:, board:)
      moves = []
      offsets = [-10, -9, 1, 11, 10, 9, -1, -11]
      offsets.each do |offset|
        endField = field + offset
        target = board[endField]
        if (target == nil || target.color != @color) && target != :border 
          moves << ChessLogic::Move.new(startField: field, endField: field + offset)
        end
      end
    end
  end
end