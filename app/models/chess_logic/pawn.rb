require_relative("piece.rb")

module ChessLogic
  class Pawn < Piece
    def initialize(color:)
      super
      @symbol = @color == "white" ? "P" : "p"
    end

    def generateMoves(field:, board:)
      moves = []
      move_direction = self.color == "white" ? DIRECTIONS[:up] : DIRECTIONS[:down]
      end_field = field + move_direction
      if board[end_field] == nil
        moves <<  ChessLogic::Move.new(start_field: field, end_field: end_field)
        if board[end_field + move_direction] == nil
          moves << ChessLogic::Move.new(start_field: field, end_field: end_field + move_direction)
        end
      end
      take_fields = []
      if self.color == "white"
        take_fields << field + DIRECTIONS[:leftUp] 
        take_fields << field + DIRECTIONS[:rightUp] 
      else
        take_fields << field + DIRECTIONS[:leftDown] 
        take_fields << field + DIRECTIONS[:rightDown] 
      end
      take_fields.each do |take_field|
        if board[take_field] != :border && board[take_field] != nil
          moves << ChessLogic::Move.new(start_field: field, end_field: take_field)
        end
      end
      moves
    end
  end
end
