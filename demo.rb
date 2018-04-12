require 'csv'
require 'date'
require 'money'
require_relative 'movie.rb'
require_relative 'movie_collection.rb'
require_relative 'netflix.rb'
require_relative 'theatre.rb'
require_relative 'ancient_movie.rb'
require_relative 'classic_movie.rb'
require_relative 'modern_movie.rb'
require_relative 'new_movie.rb'
require_relative 'cashbox.rb'
netflix = Netflix.new(ARGV[0] || 'movies.txt')
theatre = Theatre.new(ARGV[0] || 'movies.txt')

# puts netflix.balance
netflix.pay(200)
# netflix.show(genre: "Comedy", period: "new")
# netflix.show(genre: "Western", period: "classic")
# puts netflix.balance
# puts netflix.how_much?('The Terminator')
# theatre.show("09:00")
# puts theatre.when?('Psycho')
# theatre.cash
# p netflix.cash

# puts theatre.cash
# puts theatre.buy_ticket('Psycho', '09:00')
# puts theatre.cash
# puts theatre.buy_ticket('The Terminator', '15:00')
# puts theatre.cash
# puts theatre.take('Bank')
# puts theatre.cash

# puts Netflix.cash
# netflix.pay(55)
# puts Netflix.cash
# netflix.pay(45)
# puts Netflix.cash
# puts Netflix.take('Bank')
# puts Netflix.cash

#netflix.define_filter(:new_sci_fi) { |movie, year| movie.year > year && !movie.tittle.include?('Terminator') }
#netflix.define_filter(:new_we_fi) {|movie| movie.genre.include?('Western')}
#netflix.show(new_sci_fi: 2003, new_we_fi: true)

#netflix.define_filter(:new_we_fi) {|movie| movie.genre.include?('Western')}
#netflix.show(new_we_fi: true, tittle: 'The Good, the Bad and the Ugly')

netflix.define_filter(:new_we_fi) {|movie, year| movie.genre.include?('Western') && movie.year > year}
netflix.show(new_we_fi: 2010)
