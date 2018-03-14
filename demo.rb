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
#netflix.show(genre: "Comedy", period: "new")
#puts netflix.balance
#puts netflix.how_much?('The Terminator')
#puts theatre.show('The Terminator')
theatre.show('01:00')
#puts theatre.when?('Psycho')
#puts netflix.filter(genre: "Comedy", period: "new")
#puts netflix.filter(genre: /Western|Horror/, period: "classic")
#theatre.show('The Terminator')
#puts netflix.all