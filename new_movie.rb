class NewMovie < Movie
	
  def initialize (movie, collection)
  	super
  end

  def to_s
  	"#{@tittle} - new film (#{@year})"	
  end
end