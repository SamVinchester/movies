class Theatre < MovieCollection
  def show (arg)
    @mov_arr.map { |film| if film.tittle == arg
      "Now showing: " + film.tittle + " " + Time.now.strftime("%T") + " - " + (Time.now + (film.time * 60)).strftime("%T")
    end }.compact
  end
end