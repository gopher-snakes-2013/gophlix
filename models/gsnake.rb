class Gsnake < ActiveRecord::Base
  has_many :movie_ratings
  has_many :movies, through: :movie_ratings


  def run_matches
    @self_hash = {:name => self.name, :match => 1, :children => []}
    @other_gsnakes = select_relevant

    @other_gsnakes.each do |peer|
      peer_data = get_percent_similar(peer)
      x = {:name => peer_data[:name], :match => peer_data[:peer_match], :children => peer_data[:movie_array]}
      if x[:match] > 0
        @self_hash[:children] << x
      end
    end

    return @self_hash

  end


  def select_relevant
    @relevant = all_gsnakes_except_self
    with_votes_in_common(@relevant)
  end

  def all_gsnakes_except_self
    (self.blank? ? Gsnake.all : Gsnake.find(:all, :conditions => ["id != ?", self.id]))
  end

  def with_votes_in_common(gsnakes)
    gsnakes.each
  end


  def get_percent_similar(peer)
    output = {}
    output[:name] = peer.name
    output[:movie_array] = []

    cumulative_similarity_rating = 0
    cumulative_max_of_ratings = 0

    self.movies.each do |movie|
      if peer.movies.exists?(movie)
        matched_movie = {}
        matched_movie[:name] = movie.title
        self_rating = self.movie_ratings.where(movie_id: movie.id).take.rating
        peer_rating = peer.movie_ratings.where(movie_id: movie.id).take.rating

        similarity_rating = 10 - (peer_rating - self_rating).abs
        matched_movie[:match] = (similarity_rating / 10.to_f).round(2)
        output[:movie_array] << matched_movie

        cumulative_similarity_rating += similarity_rating
        cumulative_max_of_ratings += 10
      end
    end

    percent_similar = cumulative_similarity_rating.to_f / cumulative_max_of_ratings.to_f
    output[:peer_match] = percent_similar.round(2)
    return output
  end

end
