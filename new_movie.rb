class NewMovie < Movie

  def initialize (movie, collection)
  	super
  end

  def to_s
  	"#{@tittle} - new film (#{@year})"
  	"#{@tittle} - novelty, premiere " + (2018 - @year).to_s + " years ago! "
  end
end