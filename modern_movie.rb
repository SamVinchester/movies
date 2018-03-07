class ModernMovie < Movie

  def initialize (movie, collection)
  	super
  	@cost = 3
  end

  def to_s
  	"#{@tittle} - modern movie, actors: " + @actors.join(", ") + " "	
  end
end