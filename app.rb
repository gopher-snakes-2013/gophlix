require "sinatra"
require "sinatra/activerecord"
require_relative 'models/user'
require_relative 'models/game'
require_relative 'models/usersgames'

enable :sessions

set :database, "sqlite3:///db/weTree.db"

get '/' do
  p User.find(1).run_matches
  "hey"
end

# class Parser

#   def normalize_rating


#   13.times do |n|
#     rating_before = GameRating.where(game_id: 1, user_id: n)[0]

#     unless rating_before == nil
#       rating = GameRating.where(game_id: 1, user_id: n)[0][:rating]
#     else
#       rating = 0
#     end
#   end

#   end
# end

# post '/sign_in_verify' do
#   login(params[:name])

#   if signed_in_user
#     redirect '/user_home'
#   else
#     redirect '/'
#   end
# end

# get '/user_home' do
#   erb :user_home
# end

# post '/sign_out' do
#   session.delete :name
#   redirect '/'
# end

# post '/rate_games' do
#   params.keys.each_with_index do |item,index|
#     if item.to_i >=1 && params[item] != ""
#       GameRating.create(user_id: session[:name], game_id: params.keys[index].to_i, rating: params.values[index])
#     end
#   end
#   redirect '/rate_games'
# end

# post '/rate_games_page' do
#   erb :rate_games
# end

# post '/compare_users' do
#   @matches = current_user.run_matches
#   # @users = User.all
#   erb :compare_users
# end

# post '/predict_ratings' do
#   @selected_game_title = params[:game_dropdown]
#   @selected_game = Game.find_by title: @selected_game_title
#   @correlation_hash = @selected_game.run_correlations


#   @user_similarity_hash = current_user.run_matches_prediction(@correlation_hash)
#   @predicted_rating = current_user.cross_tabulate_prediction(@user_similarity_hash, @selected_game)
#   erb :predict_ratings
# end

# helpers do
#   def login(name)
#     user = User.find_by_name(name)

#     unless user.nil?
#       session[:name] = user.id
#     end
#   end

#   def signed_in_user
#     current_user
#   end

#   def current_user
#     @current_user ||= User.find_by_id(session[:name]) if session[:name]
#   end
# end

