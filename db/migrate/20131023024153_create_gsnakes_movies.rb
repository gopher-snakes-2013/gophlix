class CreateGsnakesMovies < ActiveRecord::Migration
  def up
    create_table :movie_ratings do |t|
      t.belongs_to :gsnake
      t.belongs_to :movie
      t.integer :rating
      t.timestamps
    end
  end

  def down
    drop_table :movie_ratings
  end
end
