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
        end_field = field + offset
        target = board[end_field]
        if target != :border && (target == nil || target.color != @color)
          moves << ChessLogic::Move.new(start_field: field, end_field: field + offset)
        end
      end
      moves
    end
  end
end