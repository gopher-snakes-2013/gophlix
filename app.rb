require "sinatra"
require "sinatra/activerecord"
require_relative 'models/gsnake'
require_relative 'models/movie'
require_relative 'models/gsnakesmovies'

# enable :sessions

# set :database, "sqlite3:///db/weTree.db"

get '/' do
  erb :survey
end

post '/rate_games' do
  params.keys.each_with_index do |item,index|
    if item.to_i >=1 && params[item] != ""
      MovieRating.create(user_id: session[:name], game_id: params.keys[index].to_i, rating: params.values[index])
    end
  end
  redirect '/thanks'
end

get '/thanks' do
  erb :thanks
end

# post '/rate_games_page' do
#   erb :rate_games
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