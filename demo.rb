require 'csv'
require 'date'
load "movie.rb"
load "movie_collection.rb"
KEYS = [:link, :tittle, :year, :country, :date, :genre, :time, :raiting, :producer, :actors]
mov_arr = MovieCollection.new(ARGV[0] || "movies.txt")
#puts mov_arr.all
#puts " "
#puts mov_arr.sort_by(:time)
#puts " "
#puts mov_arr.filter(year: 2001..2003, genre: /Comedy|Action/)
#puts " "
#puts mov_arr.stats(:producer)
#puts " "
#puts mov_arr.stats(:actors)
#puts " "
#puts mov_arr.stats(:year)
#puts " "
#puts mov_arr.stats(:month)
#puts " "
#puts mov_arr.stats(:month)
#puts " "
#puts mov_arr.stats(:genre)
#puts " "
#puts mov_arr.all.first.actors
#puts " "
begin
    puts mov_arr.all.first.has_genre?('Crime')
rescue ArgumentError
    puts "Указан не существующий жанр"	
end
#puts mov_arr.genres