class Gsnake < ActiveRecord::Base
  has_many :movie_ratings
  has_many :movies, through: :movie_ratings
end

def run_matches
  return Gsnake.all.inject([]) {|matches, peer| matches << [peer.name, get_percent_similar(peer)]}
end


def get_percent_similar(peer)
  cumulative_similarity_rating = 0
  cumulative_max_of_ratings = 0

  self.movies.each do |movie|
    if peer.movies.exists?(movie)
      self_rating = self.movie_ratings.where(movie_id: movie.id).take.rating
      peer_rating = peer.movie_ratings.where(movie_id: movie.id).take.rating

      similarity_rating = 10 - (peer_rating - self_rating).abs
      cumulative_similarity_rating += similarity_rating
      cumulative_max_of_ratings += 10
    end
  end
  percent_similar = cumulative_similarity_rating.to_f / cumulative_max_of_ratings.to_f
  percent_similar.round(2)
end
