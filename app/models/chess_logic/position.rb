module ChessLogic
  class Position
    attr_accessor :board,
                  :whiteToMove,
                  :castlingRights,
                  :enPassantTarget,
                  :halfMoveClock, 
                  :fullMoveCounter, 
                  :unmakeHistory

    def self.charToPiece 
      {
        'P' => ChessLogic::Pawn.new(color: "white"),
        'N' => ChessLogic::Knight.new(color: "white"),
        'B' => ChessLogic::Bishop.new(color: "white"),
        'R' => ChessLogic::Rook.new(color: "white"),
        'Q' => ChessLogic::Queen.new(color: "white"),
        'K' => ChessLogic::King.new(color: "white"),
        'p' => ChessLogic::Pawn.new(color: "black"),
        'n' => ChessLogic::Knight.new(color: "black"),
        'b' => ChessLogic::Bishop.new(color: "black"),
        'r' => ChessLogic::Rook.new(color: "black"),
        'q' => ChessLogic::Queen.new(color: "black"),
        'k' => ChessLogic::King.new(color: "black"),
      }
    end

    def self.newFromFen(fen)
      new_position = Position.new

      segments = fen.split
      boardFen = segments[0]
      ranks = boardFen.split("/")
      board = []
      20.times { board.append(:border) }
      ranks.each do |rank|
        board.append(:border)
        rank.each_char do |char|
          number = char.to_i
          if number == 0
            board.append self.charToPiece[char] || nil
          else
            number.times do
              board.append(nil)
            end
          end
        end
        board.append(:border)
      end
      20.times { board.append(:border) }
      new_position.board = board
      new_position.whiteToMove = segments[1] == "w"
      new_position
    end

    def saveToFen()
      fen = ""
      12.times do |i|
        empty_counter = 0
        10.times do |j|
          piece = board[(i * 10) + j]
          if piece == :border
            next
          elsif piece
            if empty_counter > 0
              fen <<  empty_counter.to_s
              empty_counter = 0
            end
            fen << piece.symbol
          else
            empty_counter += 1
          end
        end
        if empty_counter > 0
          fen <<  empty_counter.to_s
        end
        if i > 1 && i < 9
          fen << "/"
        end
      end
      side_to_move = whiteToMove ? "w" : "b"
      "#{fen} #{side_to_move}"
    end

    # for use in console
    # rubocop:disable Rails/Output
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
    # rubocop:enable Rails/Output

    def make_move(start_field:, end_field:)
      piece = self.board[start_field]
      self.board[start_field] = nil
      self.board[end_field] = piece
      self.whiteToMove = !self.whiteToMove
    end

  end
end