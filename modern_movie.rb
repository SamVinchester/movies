class ModernMovie < Movie
  def initialize (movie, collection)
  	super
  end

  def to_s
  	"#{@tittle} - modern film (#{@year})"	
  end
end