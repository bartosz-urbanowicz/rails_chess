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
        endField = field + offset
        target = board[endField]
        if (target == nil || target.color != @color) && target != :border 
          moves << ChessLogic::Move.new(startField: field, endField: field + offset)
        end
      end
    end
  end
end