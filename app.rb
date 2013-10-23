require "sinatra"
require "sinatra/activerecord"
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
  redirect '/survey'
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
  p "-----------------------------------------"
  p current_user#.run_matches
  # p @matches = current_user.run_matches
  # erb :thanks
end

helpers do
  def signed_in_user
    current_user
  end

  def current_user
    @current_user ||= Gsnake.find_by_id(session[:gsnake_id]) if session[:gsnake_id]
  end
end





