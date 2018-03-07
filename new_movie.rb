class NewMovie < Movie

  def initialize (movie, collection)
  	super
  	@cost = 5
  end

  def to_s
  	"#{@tittle} - novelty, premiere " + (2018 - @year).to_s + " years ago! "
  end

  attr_accessor :cost
end