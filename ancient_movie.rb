class AncientMovie < Movie
  def initialize(movie, collection)
    super
    @cost = 1
  end

  def sell
    if @balance >= movie.cost
      @balance -= movie.cost
    else
      raise ArgumentError, 'not enough money!'
    end
  end

  def to_s
    "#{@tittle} - old movie(#{@year} year) " + + Time.now.strftime('%T') + ' - ' + (Time.now + (@time * 60)).strftime('%T')
  end
  attr_accessor :cost, :time
end
