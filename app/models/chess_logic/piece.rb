module ChessLogic
  class Piece
    attr_reader :color, :symbol

    DIRECTIONS =
    {
      up: -10,
      right: 1,
      down: 10,
      left: -1,
      leftUp: -11,
      rightUp: -9,
      rightDown: 11,
      leftDown: 9,
    }

    def generateRayMoves(field:, board:, direction:)
      current_field = field + direction
      moves = []
      until board[current_field] != nil
        moves << ChessLogic::Move.new(startField: field, endField: current_field)
        current_field = current_field + direction
      end
      moves
    end

    def initialize(color:)
      @color = color
    end
  end
end