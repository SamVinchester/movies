class ClassicMovie < Movie
  def initialize (movie, collection)
  	super
  	if (1945..1968) === movie[:year].to_i
      @period = "ancient"
    end
  end

  def to_s
  	"#{@tittle} - classic film (#{@year})"	
  end
end