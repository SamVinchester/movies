class NewMovie < Movie
  def initialize(movie, collection)
    super
    @cost = 5
    @period = 'new'
  end

  def to_s
    "#{@tittle} - novelty, premiere " + (2018 - @year).to_s + ' years ago! ' +
      + Time.now.strftime('%T') + ' - ' + (Time.now + (@time * 60)).strftime('%T')
  end

  attr_accessor :cost, :time
end
