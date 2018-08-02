require_relative 'movie.rb'
require_relative 'movie_collection.rb'
require_relative 'ancient_movie.rb'
require_relative 'classic_movie.rb'
require_relative 'modern_movie.rb'
require_relative 'new_movie.rb'
require_relative 'netflix.rb'
require 'haml'

class Render < Netflix
  
  def table_create
    template = File.read('template.haml')
    output = Haml::Engine.new(template).render(Movie.new, :movies => all)
    puts output
    File.open('template.html', 'w+') do |f|
      f.write output
    end
  end
end

render = Render.new((ARGV[0] || 'movies.txt'))
render.table_create