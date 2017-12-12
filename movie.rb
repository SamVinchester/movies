require 'csv'
require 'date'
class Movie
    def initialize(movie)
        @link = movie[:link]
        @tittle = movie[:tittle]
        @year = movie[:year].to_i
        @country = movie[:country]
        @date = movie[:date]
        @genre = movie[:genre]
        @time = movie[:time].to_i
        @raiting = movie[:raiting]
        @producer = movie[:producer]
        @actors = movie[:actors].split(',')
        if movie[:date].length > 6
            @month = Date._strptime(movie[:date], '%Y-%m')[:mon]
        end
    end

    def has_genre?(arg)
        @genre.include?(arg)
    end

    def method_missing(methId)
        arg = methId.id2name
        has_genre?(arg)	
    end

    attr_reader :link, :tittle, :year, :country, :date, :genre, :time, :raiting, :producer, :actors, :month
    def to_s
        "Movie: #{@tittle}, #{@genre}, #{@country}, #{@date}, #{@time}"
    end
end