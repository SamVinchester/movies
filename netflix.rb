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

  def user_filter(filter_name = nil, &block)
    @mov_arr = @mov_arr.select { |movie| yield(movie, @year) } if block_given?
    if @filters.nil? && block.nil?#filter_name.nil?
      filter(filter_name)
    elsif @filters != nil
      p user = filter_name.partition { |filter| @filters.has_key?(filter[0]) }[0]
      user.reduce(@mov_arr) { |coll, filter| @mov_arr = coll.select{|movie| (@filters[filter[0]]).call(movie, filter[1])} }
      #user.each{ |pair| @mov_arr = @mov_arr.select{|movie| (@filters[pair[0]]).call(movie, pair[1])}}
      @mov_arr
      default = filter_name.partition { |filter| @filters.has_key?(filter[0]) }[1]
      @mov_arr = filter(default.to_h)
    else
      @mov_arr
    end
  end

  def show(filter_name = nil, &block)
    @movie = user_filter(filter_name, &block).sample
    puts 'Now showing: ' + @movie.to_s
    raise ArgumentError, 'not enough money!' unless @balance >= @movie.cost
    @balance -= @movie.cost
  end

  def define_filter(filter_name, &block)
    @filters ||= { }
    
    @filters.merge!(filter_name => block)
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
