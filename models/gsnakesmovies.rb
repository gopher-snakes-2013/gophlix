class MovieRating < ActiveRecord::Base
  belongs_to :gsnake
  belongs_to :movie
end