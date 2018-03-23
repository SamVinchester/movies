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
#netflix.pay(200)
#netflix.show(genre: "Comedy", period: "new")
#netflix.show(genre: "Western", period: "classic")
#puts netflix.balance
#puts netflix.how_much?('The Terminator')
#theatre.show("09:00")
#puts theatre.when?('Psycho')
#theatre.cash
#p netflix.cash
puts theatre.cash
#puts netflix.cash
#netflix.pay(100)
#puts netflix.cash
puts theatre.buy_ticket("Psycho", "09:00")
puts theatre.cash
puts theatre.take("Bank")
puts theatre.cash