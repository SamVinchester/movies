class CopyCollection < MovieCollection

  def initialize(arg)
    super
    genres.each do |genre|
      define_singleton_method genre do
      	puts filter(genre: genre)
      end
    end
  end

  

end