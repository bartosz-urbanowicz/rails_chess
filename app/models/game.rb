class Game < ApplicationRecord
    belongs_to :white_player, class_name: "User"
    belongs_to :black_player, class_name: "User"

    enum status: {
        waiting: "waiting",
        active: "active",
        finished: "finished"
      }      
    enum result: {
        white_won: "white_won",
        black_won: "black_won",
        draw: "draw"
      }   
    validates :rated, inclusion:{ in: [true, false] }
    validates :time_base, presence: true
    validates :time_increment, presence: true

    scope :active, -> {where(live: true)}
    scope :finished, -> {where(live: false)}
    scope :available_as_white, -> {where(white_player_id: nil)}
    scope :available_as_black, -> {where(black_player_id: nil)}
end
