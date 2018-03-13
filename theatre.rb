class Theatre < MovieCollection
  class << self
  	attr_accessor :shedule
  end

  SCHEDULE = { morning: { period: /ancient|classic/ }, daytime: { genre: /Comedy|Action/ }, evening: { genre: /Drama|Horror/ } }


  def show (arg)

    if (6..12) === arg.split(':').first.to_i
      puts "Now showing: " + self.filter(SCHEDULE[:morning]).sample.to_s
    elsif (12..18) === arg.split(':').first.to_i
      puts "Now showing: " + self.filter(SCHEDULE[:daytime]).sample.to_s
    elsif (18..23) === arg.split(':').first.to_i
      puts "Now showing: " + self.filter(SCHEDULE[:evening]).sample.to_s
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