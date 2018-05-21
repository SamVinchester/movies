class CopyCollection
  def initialize(collection)
    collection.genres.each do |genre|
      define_singleton_method genre.downcase! do
      	collection.filter(genre: genre.capitalize)
      end
    end
  end
end