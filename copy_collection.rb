class CopyCollection
  def initialize(arg)
    arg.map(&:genre).flatten.uniq.each do |genre|
      define_singleton_method genre.downcase! do
      	arg.select{ |movie| movie.genre.include?(genre.capitalize)}
      end
    end
  end
end