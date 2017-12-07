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
		@month = movie[:date]
	end

	def first
		@mov_arr[0]
	end

	def actors
		@mov_arr.map{|mov| mov.actors}
	end

	attr_reader :link, :tittle, :year, :country, :date, :genre, :time, :raiting, :producer, :actors, :month
	def to_s
		"Movie: #{@tittle}, #{@genre}, #{@country}, #{@date}, #{@time}"
	end
end