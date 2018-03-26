$LOAD_PATH << '.'
require 'cashbox.rb'
require 'money'

class Theatre < MovieCollection

  include Enumerable
  include Cashbox
  
  def initialize(arg)
    super
  end

  attr_accessor :money

  SCHEDULE = { (6..12) => { period: /ancient|classic/ }, (12..18) => { genre: /Comedy|Action/ }, (18..23) => { genre: /Drama|Horror/ }, (0..1) => { genre: "Western", period: "new" }}
  COST = { (6..12) => Money.new(300, "USD").cents, (12..18) => Money.new(500, "USD").cents, (18..23) => Money.new(700, "USD").cents }

  def buy_ticket (movie, time)
    sale = COST.detect {|period, cost| period.cover?(time.to_i)}[1]
    self.buy_theatre(sale)
    "You bought ticket on " + @mov_arr.map { |film| film.tittle if film.tittle == movie}.compact.join
  end

  def show (arg)
    m = arg.match(/^([0-2]\d):([0-5]\d)$/) or raise "Incorrect time!"
    hour = m[1].to_i
    raise "Incorrect time!" if hour > 23
    _, search = SCHEDULE.detect {|time, filters|time.cover?(hour)}
    if search.nil?
      puts "At this time movie is not shown"
    else
      puts "Now showing: " + self.filter(search).sample.to_s
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