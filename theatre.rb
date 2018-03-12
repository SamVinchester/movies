class Theatre < MovieCollection
  def show (arg)
    if (6..12) === arg.split(':').first.to_i
      movie = self.filter(period: /ancient|classic/).sample
      puts "Now showing: " + movie.to_s
	elsif (12..18) === arg.split(':').first.to_i
      movie = self.filter(genre: /Comedy|Action/).sample
      puts "Now showing: " + movie.to_s
	elsif (18..23) === arg.split(':').first.to_i
      movie = self.filter(genre: /Drama|Horror/).sample
      puts "Now showing: " + movie.to_s
    end
  end

  def when?(arg)
  	@mov_arr.map { |film| if film.tittle == arg && (film.period == "ancient" || film.period == "classic" )
  	    "You can watch this movie in the morning"
  	elsif film.tittle == arg && (film.genre.include?("Comedy") || film.genre.include?("Adventure"))
  	    "You can watch this movie in the afternoon"
  	elsif film.tittle == arg && (film.genre.include?("Drama") || film.genre.include?("Horror"))
  		"You can watch this movie in the evening"
  	elsif film.tittle == arg
  		"You can watch this movie at any time"
  	end }.compact.join
  end

end