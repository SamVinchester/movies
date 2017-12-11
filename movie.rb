require 'csv'
require 'date'
class Movie 
	def initialize(movie)
		@link = movie[:link]
		@tittle = movie[:tittle]
		@year = movie[:year]
		@country = movie[:country]
		@date = movie[:date]
		@genre = movie[:genre].split(',')
		@time = movie[:time].to_i
		@raiting = movie[:raiting]
		@producer = movie[:producer]
		@actors = movie[:actors].split(',')
		if movie[:date].length > 6
			@month = Date._strptime(movie[:date], '%Y-%m')[:mon]
		end
	end

	def first
		@mov_arr[0]
	end

	def actors
		@mov_arr.map{|mov| mov.actors}
	end

	def has_genre?(arg)
		@mov_arr.map{|mov| mov.genre.include?(arg)}
	end

	attr_reader :link, :tittle, :year, :country, :date, :genre, :time, :raiting, :producer, :actors, :month
	def to_s
		"Movie: #{@tittle}, #{@genre}, #{@country}, #{@date}, #{@time}"
	end
end