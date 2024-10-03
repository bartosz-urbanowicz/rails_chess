class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.boolean :rated
      t.boolean :live
      t.integer :time_base
      t.integer :time_increment
      t.integer :result
      t.text :pgn

      t.references :white_player, foreign_key: { to_table: :users }
      t.references :black_player, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
