$LOAD_PATH << '.'
require 'cashbox.rb'
require 'money'
class Netflix < MovieCollection

	include Enumerable
	include Cashbox
	extend Cashbox

	def initialize(arg)
		super
		@balance = 0
	end

	attr_accessor :balance, :money

  def show (arg)
    movie = self.filter(arg).sample
    if @balance >= movie.cost
      @balance -= movie.cost
    else
      raise ArgumentError, "not enough money!"
    end
    puts "Now showing: " + movie.to_s
  end


  def how_much?(arg)
    @mov_arr.map{|film| if film.tittle == arg
      if film.period == "ancient"
        "cost of the film is 1$"
      elsif film.period == "classic"
        "cost of the film is 1.5$"
      elsif film.period == "modern"
      	"cost of the film is 3$"
      elsif film.period == "new"
      	"cost of the film is 5$"
      end
    end}.compact.join
  end
end