class NewMovie < Movie
  def initialize (movie, collection)
  	super
  	if (2000..2018) === movie[:year].to_i
      @period = "ancient"
    end
  end

  def to_s
  	"#{@tittle} - new film (#{@year})"	
  end
end