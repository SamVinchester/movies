class ClassicMovie < Movie
  def initialize(movie)#, collection)
    super
    @cost = 1.5
    @period = 'classic'
  end

  def to_s
    "#{@tittle} - classic movie, producer #{@producer} " +
      + Time.now.strftime('%T') + ' - ' + (Time.now + (@time.to_i * 60)).strftime('%T')
  end
  attr_accessor :cost, :time
end
