class User < ActiveRecord::Base
  has_many :game_ratings, dependent: :destroy
  has_many :games, through: :game_ratings

#For un-weighted user matches
  def run_matches
    return User.all.inject([]) {|matches, user| matches << [user.name, compare_match(user)]}
  end


  def compare_match(user)
    rating_total = 0
    sum_weight = 0

    self.games.each do |game|
      if user.games.exists?(game)
        selfrating = self.game_ratings.where(game_id: game.id).take.rating
        userrating = user.game_ratings.where(game_id: game.id).take.rating

        key_difference = 10 - (userrating - selfrating).abs
        rating_total += key_difference
        sum_weight += 10
      end
    end
    match = rating_total.to_f / sum_weight.to_f
    (match*100).round
  end




#For correlation-weighted user matches
  def run_matches_prediction(correlation_hash)
    users = {}
    User.all.each do |user|
      users[user.name] = compare_match_prediction(user, correlation_hash)
    end
    return users
  end

  def compare_match_prediction(user, correlation_hash)
    rating_total = 0
    sum_weight = 0

    self.games.each do |game|
      if user.games.exists?(game)
        selfrating = self.game_ratings.where(game_id: game.id).take.rating
        userrating = user.game_ratings.where(game_id: game.id).take.rating

        correlation = correlation_hash[game.title]

        key_difference = 10 - (userrating - selfrating).abs
        rating_total += key_difference*correlation
        sum_weight += 10*correlation
      end
    end
    match = rating_total.to_f / sum_weight.to_f
    (match*100).round
  end


  def cross_tabulate_prediction(users, game)
    rating_total = 0
    sum_weight = 0

    User.all.each do |user|
      if GameRating.exists?(game_id: game.id, user_id: user.id)
        rating_total += GameRating.find_by(game_id: game.id, user_id: user.id).rating * users[user.name]
        sum_weight += 10 * users[user.name]
      end
    end
    prediction = rating_total.to_f / sum_weight.to_f
    prediction.round(2)*10
  end
end



