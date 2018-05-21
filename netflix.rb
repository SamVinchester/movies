require_relative 'cashbox.rb'
require 'money'

class Netflix < MovieCollection
  include Enumerable
  extend Cashbox

  def initialize(arg)
    super
    @balance = 0
    @custom_filters = { }
    @new_filter = { }
  end

  attr_accessor :balance

  def pay(cents)
    raise 'Incorrect pay' unless cents.is_a?(Integer)
    @balance += cents
    self.class.pay(cents)
  end

  def user_filter(filters = { }, &block)
    custom, internal = filters.partition { |name, _| @custom_filters.has_key?(name) }
    films = filter(internal.to_h)
    films = custom.reduce(films){|coll, filter| coll.select{|movie| (@custom_filters[filter[0]]).call(movie, filter[1])} }
    return films unless block_given?
    films.select { |movie| yield(movie, @year) }
  end

  def show(filters = { }, &block)
    @movie = user_filter(filters , &block).sample
    puts 'Now showing: ' + @movie.to_s
    raise ArgumentError, 'not enough money!' unless @balance >= @movie.cost
    @balance -= @movie.cost
  end

  def define_filter(filter_name, from: nil, arg: 0, &block)
    raise 'from: Incorrect filter' if from && !@custom_filters.has_key?(from)
    @custom_filters[filter_name] = from ? proc { |movie| @custom_filters[from].call(movie, arg) } : block
  end

  def by_genre
    CopyCollection.new(self)
  end

  def by_country
    CopyCollection.new(self)
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
