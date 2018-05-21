class CopyCollection
  def initialize(collection)
  	@collection = collection
    collection.genres.each do |genre|
      define_singleton_method genre.downcase do
      	collection.filter(genre: genre.capitalize)
      end
    end
  end

  def method_missing(country)
  	@collection.filter(country: /#{country}/i)
  end
end