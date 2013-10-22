class Game < ActiveRecord::Base
  has_many :game_ratings, dependent: :destroy
  has_many :users, through: :game_ratings



  def run_correlations
    correlations = {}
    Game.all.each do |game|
      correlations[game.title] = correlation(game).round(2).abs
    end
    return correlations
  end


  def correlation(game2)
    z = establish_arrays(game2)
    x = z[0]
    y = z[1]

    n=x.length

    sumx=x.inject(0) {|r,i| r + i}
    sumy=y.inject(0) {|r,i| r + i}

    sumxSq=x.inject(0) {|r,i| r + i**2}
    sumySq=y.inject(0) {|r,i| r + i**2}

    prods=[]; x.each_with_index{|this_x,i| prods << this_x*y[i]}
    pSum=prods.inject(0){|r,i| r + i}

    num=pSum-(sumx*sumy/n)
    den=((sumxSq-(sumx**2)/n)*(sumySq-(sumy**2)/n))**0.5
    if den==0
      return 0
    end
    r=num/den
    return r
  end

  def establish_arrays(game2)
    x = []
    y = []
    User.all.each do |user|
      if GameRating.exists?(game_id: self.id, user_id: user.id) and GameRating.exists?(game_id: game2.id, user_id: user.id)
        x << GameRating.find_by(game_id: self.id, user_id: user.id).rating
        y << GameRating.find_by(game_id: game2.id, user_id: user.id).rating
      end
    end
    final_arrays = [x,y]
    return final_arrays
  end

  # def predict

end
