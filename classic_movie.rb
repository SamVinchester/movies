class ClassicMovie < Movie

  def initialize (movie, collection)
  	super
  end

  def to_s
  	"#{@tittle} - classic movie, producer #{@producer} "
  end
end