class Game < ApplicationRecord
    enum :result, [ "white_won", "black_won", "draw" ]
    validates :rated, inclusion:{ in: [true, false] }
    validates :time_base, presence: true
    validates :time_increment, presence: true
end
