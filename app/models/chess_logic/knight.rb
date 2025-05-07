module ChessLogic
  class Knight < Piece
    def initialize(color:)
      super
      @symbol = @color == "white" ? "N" : "n"
    end

    def generateMoves(field:, board:)
      moves = []
      offsets = [-21, -19, -8, 12, 21, 19, 8, -12]
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