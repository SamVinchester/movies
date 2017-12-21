require 'csv'
require 'date'
require 'time'

class Movie
    def initialize(movie, collection)
        @link = movie[:link]
        @tittle = movie[:tittle]
        @year = movie[:year].to_i
        @country = movie[:country]
        @date = movie[:date]
        @genre = movie[:genre]#.split(',')
        @time = movie[:time].to_i
        @raiting = movie[:raiting]
        @producer = movie[:producer]
        @actors = movie[:actors].split(',')
        if movie[:date].length > 6
            @month = Date._strptime(movie[:date], '%Y-%m')[:mon]
        end
        @collection = collection
        if (1900..1945) === movie[:year].to_i
            @period = "ancient"
        elsif (1945..1968) === movie[:year].to_i
            @period = "classic"
        elsif (1968..2000) === movie[:year].to_i
            @period = "modern"
        elsif (2000..2017) === movie[:year].to_i
            @period = "new"
        end
    end

    def has_genre?(arg)

    	unless @collection.genres.include?(arg)
    		raise ArgumentError, "Genre is not found"
        end
        @genre.include?(arg)
    end

    attr_reader :link, :tittle, :year, :country, :date, :genre, :time, :raiting, :producer, :actors, :month, :period
    def to_s
        "Movie: #{@tittle}, #{@genre}, #{@country}, #{@date}, #{@time}"
    end
end
