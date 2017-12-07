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
puts mov_arr.filter(genre: 'Western')
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
#puts mov_arr.has_genre?('Comedy')