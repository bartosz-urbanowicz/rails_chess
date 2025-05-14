class ReplaceLiveWithStatusEnumInGames < ActiveRecord::Migration[7.1]
  def up
    remove_column :games, :live, :boolean

    execute <<-SQL
      CREATE TYPE game_status AS ENUM ('waiting', 'active', 'finished');
    SQL

    add_column :games, :status, :game_status, default: 'waiting', null: false
  end

  def down
    remove_column :games, :status

    execute <<-SQL
      DROP TYPE game_status;
    SQL

    add_column :games, :live, :boolean
  end
end
