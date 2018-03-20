require 'csv'
require 'date'
require 'money'
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
netflix.pay(200)
#netflix.show(genre: "Comedy", period: "new")
#netflix.show(genre: "Western", period: "classic")
#puts netflix.balance
#puts netflix.how_much?('The Terminator')
#theatre.show("09:00")
#puts theatre.when?('Psycho')
#netflix.cash
#theatre.buy_ticket( "The Terminator", "09:00")
#theatre.buy_ticket( "Casablanca", "15:00")
#theatre.cash("Theatre")
#theatre.take("Bank")
#theatre.cash("Theatre")
netflix.cash("Netflix")
netflix.take("John")
netflix.cash("Netflix")