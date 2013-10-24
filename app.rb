require "sinatra"
require "sinatra/activerecord"
require 'json'
require_relative 'models/gsnake'
require_relative 'models/movie'
require_relative 'models/gsnakesmovies'

enable :sessions

set :database, "postgres://localhost/gophlix"

get '/' do
  erb :welcome
end

post '/welcome' do
  session[:gsnake_id] = params[:gsnake_id]

  @x = current_user.run_matches
  content_type :json
  
  return @x.to_json
end

get '/my_movie_map' do 
  erb :my_movie_map
end

get '/survey' do
  erb :survey
end

post '/rate_movie' do
  params.keys.each_with_index do |item,index|
    if item.to_i >=0
      MovieRating.create!(gsnake_id: session[:gsnake_id], movie_id: params.keys[index].to_i, rating: params.values[index].to_i)
    end
  end
  redirect '/thanks'
end

get '/thanks' do
  erb :thanks
end

helpers do
  def signed_in_user
    current_user
  end

  def current_user
    @current_user ||= Gsnake.find_by_id(session[:gsnake_id]) if session[:gsnake_id]
  end
end
