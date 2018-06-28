require_relative 'cashbox.rb'
require 'money'

class Theatre < MovieCollection
  include Enumerable
  include Cashbox

  def initialize (arg = ARGV[0] || 'movies.txt', &block)
    super
    if block_given?
      context = TheatreBuilder.new
      context.instance_eval &block
      #puts context.schedule
    end
  end

  class TheatreBuilder
    attr_reader :schedule
    def initialize
      @schedule = {}
      @builder = {}
      @times = []
    end

    def period (time, &block)
      if block_given?
        cr = PeriodBuilder.new
        cr.instance_eval &block
        puts cr.to_hash(time).class
      end
    end

    def to_hash(time)
      @schedule[time] = @builder
      @schedule
    end
  end

  class PeriodBuilder < TheatreBuilder
    def initialize
      super
    end
    def description (arg)
      @builder[:description] = arg
    end
    def filters(arg)
       @builder[:filters] = arg
    end
    def price(arg)
       @builder[:price] = arg
    end
    def hall(*arg)
       @builder[:hall] = arg
    end
    def tittle(arg)
       @builder[:tittle] = arg
    end
  end

  attr_accessor :money

  SCHEDULE = { (6..12) => { period: /ancient|classic/ },
               (12..18) => { genre: /Comedy|Action/ },
               (18..23) => { genre: /Drama|Horror/ },
               (0..1) => { genre: 'Western', period: 'new' } }.freeze

  COST = { (6..12) => Money.new(300, 'USD').cents,
           (12..18) => Money.new(500, 'USD').cents,
           (18..23) => Money.new(700, 'USD').cents }.freeze

  def buy_ticket(movie, time)
    sale = COST.detect { |period, _cost| period.cover?(time.to_i) }[1]
    pay(sale)
    'You bought ticket on ' +
      + @mov_arr.map { |film| film.tittle if film.tittle == movie }.compact.join
  end

  def show(arg)
    (m = arg.match(/^([0-2]\d):([0-5]\d)$/)) || raise('Incorrect time!')
    hour = m[1].to_i
    raise 'Incorrect time!' if hour > 23
    _, search = SCHEDULE.detect { |time, _filters| time.cover?(hour) }
    if search.nil?
      puts 'At this time movie is not shown'
    else
      puts 'Now showing: ' + filter(search).sample.to_s
    end
  end

  def when?(arg)
    if filter(period: /ancient|classic/).any? { |film| film.tittle.include?(arg) }
      'You can watch this movie in the morning'
    elsif filter(genre: /Comedy|Adventure/).any? { |film| film.tittle.include?(arg) }
      'You can watch this movie in the afternoon'
    elsif filter(genre: /Drama|Horror/).any? { |film| film.tittle.include?(arg) }
      'You can watch this movie in the evening'
    else
      'You can watch this movie at any time'
    end
  end
end
