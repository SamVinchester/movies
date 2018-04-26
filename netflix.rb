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

  def user_filter(arg = nil, &block)
    @mov_arr = @mov_arr.select { |movie| yield(movie, @year) } if block_given?
    unless arg.nil?
      user = arg.partition { |filter| @filters.has_key?(filter[0]) }[0]
      user.each{ |pair| @mov_arr = @mov_arr.select{|movie| (@filters[pair[0]]).call(movie, pair[1])}}
      @mov_arr
      default = arg.partition { |filter| @filters.has_key?(filter[0]) }[1]
      mov_arr = filter(default.to_h)
      #arg.each_pair{ |key, value|
      #if @filters.has_key?(key)
      #  @mov_arr = @mov_arr.select{|movie| (@filters[key]).call(movie, value)}
      #  arg.delete(key)
      #  arg.delete(value)
      #end }
      #@mov_arr = filter(arg)
    else
      @mov_arr
    end
  end

  def show(arg = nil, &block)
    @movie = user_filter(arg, &block).sample
    puts 'Now showing: ' + @movie.to_s
    raise ArgumentError, 'not enough money!' unless @balance >= @movie.cost
    @balance -= @movie.cost
  end

  def define_filter(arg, &block)
    @filters ||= { }
    @filters.merge!(arg => block)
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
