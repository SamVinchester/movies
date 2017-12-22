require 'csv'
require 'date'
load "movie.rb"
load "movie_collection.rb"
load "netflix.rb"
load "theatre.rb"
netflix = Netflix.new(ARGV[0] || "movies.txt")
theatre = Theatre.new(ARGV[0] || "movies.txt")

#puts netflix.show("Prisoners")
#puts theatre.show("Casablanca")

puts netflix.balance
puts netflix.pay(25)
puts netflix.show("Casablanca")
#puts netflix.show(genre: "Comedy", period: "modern")
puts netflix.balance