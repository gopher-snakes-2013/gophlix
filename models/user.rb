class User < ActiveRecord::Base
  has_many :game_ratings, dependent: :destroy
  has_many :games, through: :game_ratings

  def run_matches
    return User.all.inject([]) {|matches, user| matches << [user.name, compare_match(user)]}
  end


  def compare_match(user)

    self.games.each do |game|
      rating_total = 0
      sum_weight = 0

      if user.games.exists?(game)
        selfrating = self.game_ratings.where(game_id: game.id).take.rating
        userrating = user.game_ratings.where(game_id: game.id).take.rating

        rating_total += 10 - (userrating - selfrating).abs
        sum_weight += 10
      end
    end

    match = rating_total.to_f / sum_weight.to_f
    (match*100).round
  end

end

