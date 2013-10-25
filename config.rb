require "sinatra"
require "sinatra/activerecord"
require 'json'

require './models/gsnake'
require './models/movie'
require './models/gsnakesmovies'

set :database, ENV['DATABASE_URL'] ||= 'postgres://localhost/gophlix'
