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
#puts theatre.cash
#puts theatre.buy_ticket("Psycho", "09:00")
#puts theatre.cash
#puts theatre.take("Bank")
#puts theatre.cash
#puts Netflix.cash
#Netflix.pay(55)
#puts Netflix.cash
#puts Netflix.take("Bank")
#puts Netflix.cash

puts Netflix.cash # => 0
n1 = Netflix.new(ARGV[0] || "movies.txt")
puts n1.pay(20)
puts Netflix.cash # => 20
#n2 = Netflix.new(ARGV[0] || "movies.txt")
#n2.pay(30)
#Netflix.cash  # => 50