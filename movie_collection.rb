class MovieCollection
	def initialize(arg)
		@mov_arr = CSV.read(arg, col_sep: "|")
		  .map { |line| Movie.new(KEYS.zip(line).to_h)}
  	end

  	def all
  		@mov_arr
  	end
	
	def sort_by (arg)
    	@mov_arr.sort_by{|mov| mov.send arg} 
  end
    def filter (arg)
        @mov_arr.select{|mov| (mov.send arg.keys[0]).include?(arg.values[0]) && (mov.send arg.keys[1]).include?(arg.values[1])}
    end

	def stats (arg)
		    @mov_arr.map{|mov| (mov.send arg)}
          .compact.flatten.each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1}
	end

	def to_s
		"#{@mov_arr}"
	end
end