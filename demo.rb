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
load "cashbox.rb"
netflix = Netflix.new(ARGV[0] || "movies.txt")
theatre = Theatre.new(ARGV[0] || "movies.txt")

#puts netflix.balance
#netflix.pay(25)
#netflix.show(genre: "Comedy", period: "new")
#netflix.show(genre: "Western", period: "classic")
#puts netflix.balance
#puts netflix.how_much?('The Terminator')
#theatre.show("09:00")
#puts theatre.when?('Psycho')
#netflix.cash
theatre.buy_ticket("09:00")
theatre.cash
#p theatre.filter(@search).sample.to_s