class User < ApplicationRecord
    has_many :white_games, class_name: 'Game', foreign_key: 'white_player_id'
    has_many :black_games, class_name: 'Game', foreign_key: 'black_player_id'
    enum :title, [ "CM", "FM", "IM", "GM", "WCM", "WFM", "WIM", "WGM" ]
    validates :username, presence: true
    validates :rating, presence: true
end
