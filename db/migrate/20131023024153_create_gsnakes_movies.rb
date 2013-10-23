class CreateGsnakesMovies < ActiveRecord::Migration
  def up
    create_join_table :movies, :gsnakes, table_name: :movie_ratings do |t|
      t.integer :rating
      t.timestamps
    end
  end

  def down
    drop_table :movie_ratings
  end
end
