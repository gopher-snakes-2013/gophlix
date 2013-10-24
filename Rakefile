require './app'
require 'sinatra/activerecord/rake'

namespace :db do
  desc "populate database with movie titles and gsnakes"
  task :seed do
    movies = ["The Avengers", "Big Fish", "Bridesmaids", "Donnie Darko", "Fight Club", "Finding Nemo", "The Hangover", "Love Actually", "Mulan", "The Office", "Royal Tennenbaums", "Rush Hour", "Space Jam", "Spirited Away"]
    gsnakes = ["Alek Sharma", "Anne Spalding", "Annie Sing", "Brandon Liu", "Brantley Beaird", "Carter Sowers", "Charles Amoako", "Cricket Wallace", "Dan Bender", "Daniel Trostli", "Gary Tsai", "Jeff Edwards", "Jenny Yee", "John Uke", "Jonathan Turnbull-Reilly", "Kenneth Yu", "Laura Mead", "Marion Knight", "Natalie Uduwela", "Paul Chong", "Robert Taraya", "Ryan Hedges", "Salar Khan", "Steven Nugent", "Taylor Hudson", "Thomas Anthony", "Zee Spencer"]

    movies.each do |title|
      Movie.create(title: title)
    end

    gsnakes.each do |name|
      Gsnake.create(name: name)
    end

  end
end
