class AncientMovie < Movie
  def initialize(movie)#, collection)
    super
    @cost = 1
    @period = 'ancient'
  end

  def to_s
    "#{@tittle} - old movie(#{@year} year) " +
      + Time.now.strftime('%T') + ' - ' + (Time.now + (@time.to_i * 60)).strftime('%T')
  end
  attr_accessor :cost, :time
end
