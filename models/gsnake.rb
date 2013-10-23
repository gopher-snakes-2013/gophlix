class Gsnake < ActiveRecord::Base
  has_many :movie_ratings
  has_many :movies, through: :movie_ratings
end

def run_matches
  return Gsnake.all.inject([]) {|matches, peer| matches << [peer.name, compare_match(peer)]}
end


def compare_match(peer)
  rating_total = 0
  sum_weight = 0

  self.movies.each do |movie|
    if peer.movies.exists?(movie)
      self_rating = self.movie_ratings.where(movie_id: movie.id).take.rating
      peer_rating = peer.movie_ratings.where(movie_id: movie.id).take.rating

      key_difference = 10 - (peerrating - selfrating).abs
      rating_total += key_difference
      sum_weight += 10
    end
  end
  match = rating_total.to_f / sum_weight.to_f
  match.round(2)
end
