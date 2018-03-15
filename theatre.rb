class Theatre < MovieCollection
  class << self
  	attr_accessor :shedule
  end

  SCHEDULE = { (6..12) => { period: /ancient|classic/ }, (12..18) => { genre: /Comedy|Action/ }, (18..23) => { genre: /Drama|Horror/ }, (0..1) => { genre: "Western", period: "new" }}


  def show (arg)

    if arg.match?(/[0-2][0-3]:[0-5][0-9]/)
      hour = arg.split(':').first.to_i
    elsif arg.match?(/[0][1-6]:[0-5][0-9]/)
      puts "At this time movie is not shown"
    else 
      raise ArgumentError, "Incorrect time!"
    end

    puts "Now showing: " + self.filter(SCHEDULE.detect {|time, filters| time.cover?(hour)}[1]).sample.to_s
    #hour = arg.split(':').first.to_i
    #if (6..23).cover?(hour) || (0..1).cover?(hour)
    #  puts "Now showing: " + self.filter(SCHEDULE.detect {|time, filters| time.cover?(hour)}[1]).sample.to_s
    #elsif (1..6).cover?(hour)
    #  puts "At this time movie is not shown"
    #else
    #  puts "Incorrect time!"
    #end
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