class ConvertResultToEnumInGames < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TYPE game_result AS ENUM ('white_won', 'black_won', 'draw');
    SQL

    change_column :games, :result, :game_result, using: 'NULL::game_result'
  end

  def down
    change_column :games, :result, :integer, default: 0, null: false

    execute <<-SQL
      DROP TYPE game_result;
    SQL
  end
end
