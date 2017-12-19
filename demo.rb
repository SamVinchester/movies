require 'csv'
require 'date'
load "movie.rb"
load "movie_collection.rb"
load "netflix.rb"
load "theatre.rb"
KEYS = [:link, :tittle, :year, :country, :date, :genre, :time, :raiting, :producer, :actors]
netflix = Netflix.new(ARGV[0] || "movies.txt")
theatre = Theatre.new(ARGV[0] || "movies.txt")

puts netflix.show("Akira")
puts theatre.show("Pulp Fiction")