class ClassicMovie < Movie

  def initialize (movie, collection)
  	super
  	@cost = 1.5
  end

  def to_s
  	"#{@tittle} - classic movie, producer #{@producer} "
  end
end