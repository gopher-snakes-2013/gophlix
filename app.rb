require "sinatra"
require "sinatra/activerecord"
require 'json'

require './models/gsnake'
require './models/movie'
require './models/gsnakesmovies'

set :database, ENV['DATABASE_URL'] ||= 'postgres://localhost/gophlix'

## D3 Map Shenanigans:

# get '/' do
#   erb :gophlix
# end

# post '/welcome' do
#   selected_user = Gsnake.find_by_id(params[:gsnake_id])
#   data = selected_user.run_matches

# # uncomment if want to create JSON file
#   # File.open("public/test.json","w") do |f|
#   #   f.write(data.to_json)
#   # end

#   content_type :json
#   return data.to_json
# end

## Survey Shnaz:

get '/' do
  erb :survey
end

post '/rate_movie' do

  params[:movies].each do |movie|
    if movie[:rating] != ""
      rating = MovieRating.find_or_create_by(movie_id: movie[:id], gsnake_id: params[:gsnake_id])
      rating.update_attributes(rating: movie[:rating])
    end
  end
  redirect '/thanks'
end

get '/thanks' do
  erb :thanks
end

