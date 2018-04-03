require_relative 'cashbox.rb'
require 'money'

class Netflix < MovieCollection
  include Enumerable
  extend Cashbox

  def initialize(arg)
    super
    @balance = 0
  end

  attr_accessor :balance

  def pay(cents)
    raise 'Incorrect pay' unless cents.is_a?(Integer)
    @balance += cents
    self.class.pay(cents)
  end

  def show(arg = nil)
    if block_given?
      puts @mov_arr.select { |movie| yield(movie, @year) }.sample
    elsif arg.value?(true)
      show(&@filters.values[0])
    elsif arg.values[0].is_a?(Integer)
      @year = arg.values[0]
      show(&@filters.values[0])
    elsif
      movie = filter(arg).sample
      raise ArgumentError, 'not enough money!' unless @balance >= movie.cost
      @balance -= movie.cost
      puts 'Now showing: ' + movie.to_s
    end
  end

  def define_filter(arg, &block)
    @filters = {}
    @filters[arg] = block
  end

  def how_much?(arg)
    @mov_arr.map do |film|
      if film.tittle == arg
        if film.period == 'ancient'
          'cost of the film is 1$'
        elsif film.period == 'classic'
          'cost of the film is 1.5$'
        elsif film.period == 'modern'
          'cost of the film is 3$'
        elsif film.period == 'new'
          'cost of the film is 5$'
        end
      end
    end .compact.join
  end
end
