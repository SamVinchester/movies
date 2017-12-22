class Netflix < MovieCollection

	def initialize(arg)
		super
		@balance = 0
	end

	attr_accessor :balance

	def pay(arg)
	    if arg.class == Integer
	        @balance += arg
	    end
	end

  def show (arg)
      if arg.class == String
          @mov_arr.map { |film| if film.tittle == arg
    	      if film.period == "ancient"
    	      	  @balance -= 1
    	          "Now showing: " + film.tittle + " - old film(" + (film.year).to_s + " year) " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
              elsif film.period == "classic"
              	  @balance -= 1.5
        	      a = film.producer
        	      "Now showing: " + film.tittle + " - classic film, producer " + film.producer + " (" +(@mov_arr.map { |mov| if mov.producer == a
        		  mov.tittle
        	      end} - [arg]).compact.join("; ") + ") " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
              elsif film.period == "modern"
              	  @balance -= 3
                  "Now showing: " + film.tittle + " - modern movie, actors " + (film.actors).join(", ") + " " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
              elsif film.period == "new"
              	  @balance -= 5
                  "Now showing: " + film.tittle + " - novelty, premiere " + (2017 - film.year).to_s + " years ago! " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
              end      	
           end }.compact.join
      elsif arg.class == Hash
          @mov_arr.select{|mov| arg.all?{|key, value| (mov.send(key).to_s).include?(value)}}
          .map { |film| if film.period == "ancient"
    	          "Now showing: " + film.tittle + " - old film(" + (film.year).to_s + " year) " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
              elsif film.period == "classic"
        	      a = film.producer
        	      "Now showing: " + film.tittle + " - classic film, producer " + film.producer + " (" +(@mov_arr.map { |mov| if mov.producer == a
        		  mov.tittle
        	      end} - [arg]).compact.join("; ") + ") " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
              elsif film.period == "modern"
                  "Now showing: " + film.tittle + " - modern movie, actors " + (film.actors).join(", ") + " " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
              elsif film.period == "new"
                  "Now showing: " + film.tittle + " - novelty, premiere " + (2017 - film.year).to_s + " years ago! " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
              end  }.shuffle.first
      end
  end

  #def filter (arg)
  #    @mov_arr.select{|mov| arg.all?{|key, value| value === mov.send(key)}}
  #end

end