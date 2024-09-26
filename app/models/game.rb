class Game < ApplicationRecord
    enum :result, [ "white_won", "black_won", "draw" ]
    validates :rated, presence: true
    validates :time_base, presence: true
    validates :time_increment, presence: true
    validates :winner, presence: true
end
