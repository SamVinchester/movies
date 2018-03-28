class ClassicMovie < Movie
  def initialize(movie, collection)
    super
    @cost = 1.5
  end

  def to_s
    "#{@tittle} - classic movie, producer #{@producer} " +
      + Time.now.strftime('%T') + ' - ' + (Time.now + (@time * 60)).strftime('%T')
  end
  attr_accessor :cost, :time
end
