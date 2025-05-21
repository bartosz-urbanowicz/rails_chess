class Game < ApplicationRecord
    belongs_to :white_player, class_name: "User"
    belongs_to :black_player, class_name: "User"
    has_many :game_moves

    after_update_commit lambda {
      broadcast_replace_to("game_#{id}",
                           partial: "games/chessboard",
                           locals: {
                             game: self,
                             position: ChessLogic::Position.newFromFen(position),
                             possible_moves: [],
                             field: 0,
                             player_color: position.split[1] == "w" ? "white" : "black"
                           },
                           target: "chessboard")
    }

    enum :status, {
        waiting: "waiting",
        active: "active",
        finished: "finished"
      }      
    enum :result, {
        white_won: "white_won",
        black_won: "black_won",
        draw: "draw"
      }   
    validates :rated, inclusion:{ in: [true, false] }
    validates :time_base, presence: true
    validates :time_increment, presence: true

    scope :active, -> {where(status: "active")}
    scope :finished, -> {where(status: "finished")}
    scope :waiting, -> {where(status: "waiting")}
    scope :available_as_white, -> {where(white_player_id: nil)}
    scope :available_as_black, -> {where(black_player_id: nil)}
end
