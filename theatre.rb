class Theatre < MovieCollection
  def show (arg)
    @mov_arr.map { |film| if arg == film.tittle
      "Now showing: " + film.tittle + " " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
    elsif (6..12) === arg.split(':').first.to_i
	  if film.period == "ancient" || film.period == "classic"
	  	"Now showing: " + film.tittle + " " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
	  end
	elsif (12..18) === arg.split(':').first.to_i
	  if film.genre.include?("Comedy") || film.genre.include?("Adventure")
		"Now showing: " + film.tittle + " " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
	  end
	elsif (18..23) === arg.split(':').first.to_i
	  if film.genre.include?('Drama') || film.genre.include?("Horror")
	  	"Now showing: " + film.tittle + " " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
	  end
    end }.compact.shuffle.first
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