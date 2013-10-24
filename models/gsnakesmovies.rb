class MovieRating < ActiveRecord::Base
  belongs_to :gsnake
  belongs_to :movie
  validates :rating, :gsnake_id, :movie_id, presence: true

end
