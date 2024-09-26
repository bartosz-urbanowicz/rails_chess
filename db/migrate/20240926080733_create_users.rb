class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :rating, default: 100
      t.integer :title
      t.timestamps
    end
  end
end
