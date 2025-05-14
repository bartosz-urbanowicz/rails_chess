# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(username: "jan", email: "jan@example.com", password: "zaq1@WSX")
User.create(username: "bartek", email: "bartek@example.com", password: "zaq1@WSX")
Game.create(rated: true, status: "active", time_base: 10, time_increment: 0, result: nil, white_player_id: 1, black_player_id: 2)
Game.create(rated: false, status: "waiting", time_base: 5, time_increment: 1, result: nil, white_player_id: 2)