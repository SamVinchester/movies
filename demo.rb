require 'csv'
require 'date'
load "movie.rb"
load "movie_collection.rb"
load "netflix.rb"
load "theatre.rb"
load "ancient_movie.rb"
load "classic_movie.rb"
load "modern_movie.rb"
load "new_movie.rb"
netflix = Netflix.new(ARGV[0] || "movies.txt")
theatre = Theatre.new(ARGV[0] || "movies.txt")

#puts netflix.show("Casablanca")
#puts theatre.show("Casablanca")

#puts netflix.balance
#puts netflix.pay(25)
#puts netflix.show("Diabolique")
#netflix.show(genre: "Comedy", period: "new")
#puts netflix.balance
#puts netflix.how_much?('The Terminator')
#puts theatre.show('The Terminator')
#puts theatre.show('09:00')
#puts theatre.when?('Psycho')
#puts netflix.filter(genre: /Drama|Horror/)
#theatre.show('The Terminator')
puts netflix.all