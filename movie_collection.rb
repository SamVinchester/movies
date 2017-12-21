class MovieCollection
  KEYS = [:link, :tittle, :year, :country, :date, :genre, :time, :raiting, :producer, :actors]
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
      @mov_arr.select{|mov| arg.all?{|key, value| (mov.send(key).to_s).include?(value)}}
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