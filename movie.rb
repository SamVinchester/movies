require 'csv'
require 'date'
require 'time'
require 'virtus'

class Movie
  include Virtus.model

  #def initialize(movie, collection)
  #  @link = movie[:link]
  #  @tittle = movie[:tittle]
  #  @year = movie[:year].to_i
  #  @country = movie[:country]
  #  @date = movie[:date]
  #  @genre = movie[:genre].split(',')
  #  @time = movie[:time].to_i
  #  @raiting = movie[:raiting]
  #  @producer = movie[:producer]
  #  @actors = movie[:actors].split(',')
  #  @month = Date._strptime(movie[:date], '%Y-%m')[:mon] if movie[:date].length > 6
  #  @collection = collection
  #end

  attribute :link, String
  attribute :tittle, String
  attribute :year, Integer
  attribute :country, String
  attribute :date, String
  attribute :genre, String
  attribute :time, Integer
  attribute :raiting, String
  attribute :producer, String
  attribute :actors, Array
  attribute :month, Integer
  attribute :period, String
  attribute :poster, String
  attribute :budget, String
  attribute :collection

  def genre=(new_genre)
    new_genre = new_genre.split(',')
    super new_genre
  end

  def match?(key, value)
    Array(send(key)).any? { |genre| value === genre } # rubocop:disable Style/CaseEquality
  end

  def self.create(movie, collection)
    case movie[:year].to_i
    when 1900..1945
      AncientMovie.new(movie)#, collection)
    when 1945..1968
      ClassicMovie.new(movie)#, collection)
    when 1968..2000
      ModernMovie.new(movie)#, collection)
    when 2000..2018
      NewMovie.new(movie)#, collection)
    end
  end

  def poster
    thing = YAML.load_file('posters.yml')
    thing.map{|pair| pair.split(' : ') }.map{|pair| pair[1] if tittle == pair[0]}.compact[0]

    #posters = JSON.parse(thing.inspect).class
    #posters.map{|poster| {:tittle => poster}}
    #puts posters
  end

  def budget
    thing = YAML.load_file('budgets.yml')
    thing.map{|pair| pair.split(' : ') }.map{|pair| pair[1] if tittle == pair[0]}.compact[0]
  end

  def genre?(arg)
    raise ArgumentError, 'Genre is not found' unless @collection.genres.include?(arg)
    @genre.include?(arg)
  end

  #attr_reader :link, :tittle, :year, :country, :date, :genre,
  #            :time, :raiting, :producer, :actors, :month, :period
  def to_s
    "Movie: #{@tittle}, #{@genre}, #{@country}, #{@date}, #{@time} min"
  end
end
