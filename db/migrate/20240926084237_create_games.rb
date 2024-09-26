class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.boolean :rated
      t.integer :time_base
      t.integer :time_increment
      t.integer :result
      t.text :pgn

      t.references :white_player, foreign_key: { to_table: :players }
      t.references :black_player, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end
