class CopyCollection < MovieCollection

  def initialize(arg)
    super
    genres.each do |genre|
      define_singleton_method genre.downcase! do
      	puts filter(genre: genre.capitalize)
      end
    end
  end



end