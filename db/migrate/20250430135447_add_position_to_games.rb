class AddPositionToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :position, :string
  end
end
