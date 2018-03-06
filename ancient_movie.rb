class AncientMovie < Movie
  
  def initialize(movie, collection)
  	super
  end

  def to_s
  	"#{@tittle} - ancient film (#{@year})"	
  end
end