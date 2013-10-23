class Movie < ActiveRecord::Base
  has_many :movie_ratings
  has_many :gsnakes, through: :movie_ratings
end