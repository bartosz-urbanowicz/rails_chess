class CreateGameMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :game_moves do |t|
      t.integer :start_field
      t.integer :end_field
      t.string :type
      t.string :side

      t.timestamps
    end
  end
end
