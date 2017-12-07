class MovieCollection
	def initialize(arg)
		@mov_arr = CSV.read(arg, col_sep: "|")
		  .map { |line| Movie.new(KEYS.zip(line).to_h)}
  	end

  	def all
  		@mov_arr
  	end
	
	def sort_by (arg)
    	@mov_arr.sort_by{|film| film.send arg}
	end

	def filter (arg)
		@mov_arr.select{|film| if arg.has_key?(:genre)
			film.genre.include?(arg[:genre])
		else film.country.include?(arg[:country])
		end}
	end

	def stats (arg)

		if arg == :month
			@mov_arr.map{|mov| mov.send arg}.compact.each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1} #hash of month
		else

		@mov_arr.map{|mov| mov.send arg}.each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1} #hash of producers

		@mov_arr.map{|mov| (mov.send arg).split(',')}.flatten.each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1} #hash of actors

		@mov_arr.map{|mov| mov.send arg}.each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1} #hash of years

		@mov_arr.map{|mov| mov.send arg}.each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1} #hash of country

        @mov_arr.map{|mov| (mov.send arg).split(',')}.flatten.each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1} #hash of genre
        end
	end

	def first
		@mov_arr[0]
	end

	def actors
		@mov_arr.map{|mov| mov.actors}
	end

	def has_genre?(arg)
		@mov_arr.map{|mov| mov.genre.include?(arg)}
	end

	def to_s
		"#{@mov_arr}"
	end
end