class MovieCollection
	def initialize(arg)
		@mov_arr = CSV.read(arg, col_sep: "|")
		  .map { |line| Movie.new(KEYS.zip(line).to_h)}
  	end

  	def all
  		@mov_arr
  	end
	
	def sort_by (arg)
    	@mov_arr.sort_by{|film| 
    	if arg == :time
    		(film.send arg).to_i
    	else film.send arg
    	end}
	end
    
    def filter (arg)
    	#arg.each_key{|key| key}
    	@mov_arr.select{|mov| (mov.send arg).include?('Western')}
    end


	#def filter (arg)
	#	@mov_arr.select{|film| if arg.has_key?(:genre)
	#		film.genre.include?(arg[:genre])
	#	else film.country.include?(arg[:country])
	#	end}
	#end

	def stats (arg)
        if arg == :month
        	@mov_arr.map{|mov| Date._strptime((mov.send arg), '%Y-%m')}
              .compact.map{|date| date[:mon]}
              .each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1}
        else
		    @mov_arr.map{|mov| (mov.send arg).split(',')}.flatten.each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1}
		end
	end

	def has_genre?(arg)
		@mov_arr.map{|mov| mov.genre.include?(arg)}
	end

	def to_s
		"#{@mov_arr}"
	end
end