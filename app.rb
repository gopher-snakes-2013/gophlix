require "sinatra"
require "sinatra/activerecord"
require 'json'
require_relative 'models/gsnake'
require_relative 'models/movie'
require_relative 'models/gsnakesmovies'

enable :sessions

set :database, "postgres://localhost/gophlix"

helpers do
  def signed_in_user
    current_user
  end

  def current_user
    @current_user ||= Gsnake.find_by_id(session[:gsnake_id]) if session[:gsnake_id]
  end
end

get '/' do
  erb :welcome
end

post '/welcome' do
  session[:gsnake_id] = params[:gsnake_id]

  data = current_user.run_matches

  content_type :json
  return data.to_json
end

get '/survey' do
  erb :survey
end

post '/rate_movie' do
  this_movie_rating = MovieRating.find_by(gsnake_id: session[:gsnake_id])
  Movie.all.each_with_index do |movie,index|
    if this_movie_rating
      MovieRating.update(this_movie_rating.id, gsnake_id: session[:gsnake_id], movie_id: params.keys[index].to_i, rating: params.values[index])
    else
      MovieRating.create(gsnake_id: session[:gsnake_id], movie_id: params.keys[index].to_i, rating: params.values[index])
    end
  end
  redirect '/thanks'
end

get '/thanks' do
  erb :thanks
end
