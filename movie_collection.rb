class MovieCollection
  def initialize(arg)
      @mov_arr = CSV.read(arg, col_sep: "|")
        .map { |line| Movie.new(KEYS.zip(line).to_h, self)}
  end

  def all
      @mov_arr
  end
	
  def sort_by (arg)
      @mov_arr.sort_by{|mov| mov.send(arg)} 
  end

  def filter (arg)
      @mov_arr.select{|mov| arg.all?{|key, value| value === mov.send(key)}}
  end

  def stats (arg)
      @mov_arr.map{|mov| (mov.send(arg))}
        .compact.flatten.each_with_object(Hash.new{ 0 }){ |i, result| result[i] += 1}
  end

  def genres
      @mov_arr.map{|mov| mov.genre}.flatten.uniq
  end

  def to_s
      "#{@mov_arr}"
  end
end

class Netflix < MovieCollection
  def show (arg)
    @mov_arr.map { |film| if film.tittle == arg
      "Now showing: " + film.tittle + " " + Time.now.strftime("%T") + "-" + (Time.now + (film.time * 60)).strftime("%T")
    end }.compact
  end
end

class Theatre < MovieCollection
  def show (arg)
    @mov_arr.map { |film| if film.tittle == arg
      "Now showing: " + film.tittle + " " + Time.now.strftime("%T") + "-" + (Time.now + (film.time * 60)).strftime("%T")
    end }.compact
  end
end