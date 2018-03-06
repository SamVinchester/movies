class ModernMovie < Movie
  def initialize (movie, collection)
  	super
  	if (1968..2000) === movie[:year].to_i
      @period = "ancient"
    end
  end

  def to_s
  	"#{@tittle} - modern film (#{@year})"	
  end
end