class CopyCollection

  KEYS = %i[link tittle year country date genre time raiting producer actors].freeze
  def initialize(arg)
    @mov_arr = CSV.read(arg, col_sep: '|')
                  .map { |line| Movie.create(KEYS.zip(line).to_h, self) }
    @mov_arr.map(&:genre).flatten.uniq.each do |genre|
      define_singleton_method genre.downcase! do
      	@mov_arr.select{ |movie| movie.genre.include?(genre.capitalize)}
      	#filter(genre: genre.capitalize)
      end
    end
  end
end