class MovieRating < ActiveRecord::Base
  belongs_to :gsnake
  belongs_to :movie
  validates :rating, presence: true

end
