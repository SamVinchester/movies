class ModernMovie < Movie
  def initialize(movie)#, collection)
    super
    @cost = 3
    @period = 'modern'
  end

  def to_s
    "#{@tittle} - modern movie, actors: " + @actors.join(', ') + ' ' +
      + Time.now.strftime('%T') + ' - ' + (Time.now + (@time.to_i * 60)).strftime('%T')
  end
  attr_accessor :cost, :time
end
