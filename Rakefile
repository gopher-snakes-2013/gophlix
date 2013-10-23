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
    gsnakes = ["Alek Sharma", "Anne Spalding", "Annie Sing", "Brandon Liu", "Brantley Beaird", "Carter Sowers", "Charles Amoako", "Cricket Wallace", "Dan Bender", "Daniel Trostli", "Gary Tsai", "Jeff Edwards", "Jenny Yee", "John Uke", "Jonathan Turnbull-Reilly", "Kenneth Yu", "Laura Mead", "Marion Knight", "Natalie Uduwela", "Paul Chong", "Robert Taraya", "Ryan Hedges", "Salar Khan", "Steven Nugent", "Taylor Hudson", "Thomas Anthony", "Zee Spencer"]
    gsnakes.each do |name|
      Gsnake.create(name: name)
    end
  end
end

