require './app'
require 'sinatra/activerecord/rake'

namespace :db do
  desc "populate database with movie titles"
  task :seed_movies do
    movies = ["Big Fish", "Bridesmaids", "Donnie Darko", "Fight Club", "Finding Nemo", "Inception", "Love Actually", "Royal Tennenbaums", "Rush Hour", "Spirited Away", "The Avengers", "The Hangover", "The Matrix", "The Office"]
    movies.each do |title|
      Movie.create(title: title)
    end
  end
end


namespace :db do
  desc "populate database with gsnakes"
  task :seed_gsnakes do
    gsnakes = ["Anne Spalding", "John Uke", "Zee Spencer", "Daniel Trostli", "Gary Tsai", "Robert Taraya", "Thomas Anthony", "Ryan Hedges", "Alek Sharma", "Salar Khan", "Taylor Hudson", "Cricket Wallace", "Brantley Beaird", "Marion Knight", "Dan Bender", "Brandon Liu", "Kenneth Yu", "Annie Sing", "Carter Sowers", "Natalie Uduwela", "Jonathan Turnbull-Reilly", "Laura Mead", "Steven Nugent", "Jenny Yee", "Paul Chong", "Jeff Edwards", "Charles Amoako"]
    gsnakes.each do |name|
      Gsnake.create(name: name)
    end
  end
end

