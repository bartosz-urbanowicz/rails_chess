module ChessLogic
  class Position
    attr_accessor :board, :whiteToMove, :castlingRights, :enPassantTarget, :halfMoveClock, :fullMoveCounter, :unmakeHistory

    def self.charToPiece 
      {
        'P' => ChessLogic::Piece::Pawn.new(color: "white"),
        'N' => ChessLogic::Piece::Knight.new(color: "white"),
        'B' => ChessLogic::Piece::Bishop.new(color: "white"),
        'R' => ChessLogic::Piece::Rook.new(color: "white"),
        'Q' => ChessLogic::Piece::Queen.new(color: "white"),
        'K' => ChessLogic::Piece::King.new(color: "white"),
        'p' => ChessLogic::Piece::Pawn.new(color: "black"),
        'n' => ChessLogic::Piece::Knight.new(color: "black"),
        'b' => ChessLogic::Piece::Bishop.new(color: "black"),
        'r' => ChessLogic::Piece::Rook.new(color: "black"),
        'q' => ChessLogic::Piece::Queen.new(color: "black"),
        'k' => ChessLogic::Piece::King.new(color: "black"),
      }
    end

    def self.newFromFen(fen)
      newPosition = Position.new

      segments = fen.split(" ")
      boardFen = segments[0]
      ranks = boardFen.split("/")
      board = []
      20.times { board.append(:border) }
      ranks.each do |rank|
        board.append(:border)
        rank.each_char do |char|
          number = char.to_i
          if number != 0
            number.times do
              board.append(nil)
            end
          else
            board.append self.charToPiece[char] || nil
          end
        end
        board.append(:border)
      end
      20.times { board.append(:border) }
      newPosition.board = board
      newPosition
    end

    # for use in console
    def printBoard
      12.times do |i|
        10.times do |j|
          piece = board[(i * 10) + j]
          if piece == :border
            print "x"
          elsif piece
            print piece.symbol
          else
            print "."
          end
        end
        puts
      end
    end

  end
end