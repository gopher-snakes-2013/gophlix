class MovieRating < ActiveRecord::Base
  belongs_to :gsnake
  belongs_to :movie
  validates :rating, :gsnake_id, :movie_id, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
end
