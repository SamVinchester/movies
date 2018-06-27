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
require_relative 'copy_collection.rb'

#netflix = Netflix.new(ARGV[0] || 'movies.txt')
#theatre = Theatre.new(ARGV[0] || 'movies.txt')

# puts netflix.balance
#netflix.pay(200)
# netflix.show(genre: "Comedy", period: "new")
# netflix.show(genre: "Western", period: "new")
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
#netflix.show(new_sci_fi: 1900, new_we_fi: true)

#netflix.define_filter(:new_we_fi) {|movie| movie.genre.include?('Western')}
#netflix.show(new_we_fi: true, tittle: 'The Good, the Bad and the Ugly')

# netflix.show {|movie| movie.genre.include?('Western')}

#netflix.define_filter(:new_sci_fi) { |movie, year| movie.year > year && !movie.tittle.include?('Terminator') }
#netflix.show(new_sci_fi: 2010) {|movie| movie.genre.include?('Western')}

#netflix.define_filter(:new_sci_fi) { |movie, year| movie.year > year && movie.genre.include?('Western')}
#netflix.define_filter(:newest_sci_fi, from: :new_sci_fi, arg: 2010)
#netflix.show(newest_sci_fi: true)

#puts netflix.filter(country: 'USA')

#puts netflix.by_genre.western
#puts netflix.by_country.italy

theatre =
  Theatre.new do
    #hall :red, title: 'Красный зал', places: 100
    #hall :blue, title: 'Синий зал', places: 50
    #hall :green, title: 'Зелёный зал (deluxe)', places: 12

    period '09:00'..'11:00' do
      description 'Утренний сеанс'
      filters genre: 'Comedy', year: 1900..1980
      price 10
      hall :red, :blue
    end

    period '11:00'..'16:00' do
      description 'Спецпоказ'
      tittle 'The Terminator'
      price 50
      hall :green
    end

    period '16:00'..'20:00' do
      description 'Вечерний сеанс'
      filters genre: ['Action', 'Drama'], year: 2007..Time.now.year
      price 20
      hall :red, :blue
    end

    period '19:00'..'22:00' do
      description 'Вечерний сеанс для киноманов'
      filters year: 1900..1945, exclude_country: 'USA'
      price 30
      hall :green
    end
  end