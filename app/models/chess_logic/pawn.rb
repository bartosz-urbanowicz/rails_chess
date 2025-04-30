require_relative("piece.rb")

module ChessLogic
  class Pawn < Piece
    def initialize(color:)
      super
      @symbol = @color == "white" ? "P" : "p"
    end

    def generateMoves(field:, board:)
      moves = []
      endField = self.color == "white" ? field + DIRECTIONS[:up] : field + DIRECTIONS[:down]
      if board[endField] == nil
        moves <<  ChessLogic::Move.new(startField: field, endField: endField)
      end
      takeFields = []
      if self.color == "white"
        takeFields << field + DIRECTIONS[:leftUp] 
        takeFields << field + DIRECTIONS[:rightUp] 
      else
        takeFields << field + DIRECTIONS[:leftDown] 
        takeFields << field + DIRECTIONS[:rightDown] 
      end
      takeFields.each do |takeField|
        if board[takeField] != :border && board[takeField] != nil
          moves << ChessLogic::Move.new(startField: field, endField: takeField)
        end
      end
      moves
    end
  end
end
