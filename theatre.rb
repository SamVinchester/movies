class Theatre < MovieCollection
  class << self
  	attr_accessor :shedule
  end

  SCHEDULE = { (6..12) => { period: /ancient|classic/ }, (12..18) => { genre: /Comedy|Action/ }, (18..23) => { genre: /Drama|Horror/ } }


  def show (arg)
    hour = arg.split(':').first.to_i
    puts self.filter(SCHEDULE.detect {|time, filters| time.cover?(hour)}[1]).sample.to_s
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