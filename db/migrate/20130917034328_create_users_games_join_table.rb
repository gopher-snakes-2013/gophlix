class CreateUsersGamesJoinTable < ActiveRecord::Migration
  def up
    create_join_table :games, :users, table_name: :game_ratings do |t|
      t.integer :rating, null: false
      t.timestamps
    end
  end

  def down
    drop_table :game_ratings
  end
end
