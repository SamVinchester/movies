require 'csv'
require 'date'
class Movie 
	def initialize(movie)
		@link = movie[:link]
		@tittle = movie[:tittle]
		@year = movie[:year]
		@country = movie[:country]
		@date = movie[:date]
		@genre = movie[:genre]
		@time = movie[:time]
		@raiting = movie[:raiting]
		@producer = movie[:producer]
		@actors = movie[:actors]
		if movie[:date].length > 6
			@month = Date._strptime(movie[:date], '%Y-%m')[:mon]
		end

	end

	attr_reader :link, :tittle, :year, :country, :date, :genre, :time, :raiting, :producer, :actors, :month
	attr_writer :link, :tittle, :year, :country, :date, :genre, :time, :raiting, :producer, :actors
	def to_s
		"Movie: #{@tittle}, #{@genre}, #{@country}, #{@date}, #{@time}"
	end
end