class AncientMovie < Movie
  
  def initialize(movie, collection)
  	super
  	@cost = 1
  end

  def to_s
  	"#{@tittle} - old movie(#{@year} year) "	
  end
end