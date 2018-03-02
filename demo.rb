require 'csv'
require 'date'
load "movie.rb"
load "movie_collection.rb"
load "netflix.rb"
load "theatre.rb"
netflix = Netflix.new(ARGV[0] || "movies.txt")
theatre = Theatre.new(ARGV[0] || "movies.txt")

#puts netflix.show("Casablanca")
#puts theatre.show("Casablanca")

#puts netflix.balance
puts netflix.pay(25)
#puts netflix.show("Diabolique")
netflix.show(genre: "Comedy", period: "new")
puts netflix.balance
#puts netflix.how_much?('The Terminator')
#puts theatre.show('The Terminator')
#puts theatre.show('09:00')
#puts theatre.when?('Psycho')
