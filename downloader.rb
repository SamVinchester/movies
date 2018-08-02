require_relative 'movie.rb'
require_relative 'movie_collection.rb'
require_relative 'ancient_movie.rb'
require_relative 'classic_movie.rb'
require_relative 'modern_movie.rb'
require_relative 'new_movie.rb'
require 'httparty'
require 'nokogiri'

class Downloader < MovieCollection

  def get_images #получаем массив ссылок на постеры
    File.open('posters.yml', 'w+') do |f|
      f.write all.map{|movie| id = movie.link[22..30]
        @url = 'https://image.tmdb.org/t/p/w200/'
        response = HTTParty.get('https://api.themoviedb.org/3/movie/' + id + '/images?api_key=d83731a8549bd375936b9779a5b6bb0d')
        #progressbar = ProgressBar.create(:title => "Getting posters", :starting_at => 0, :total => 200)
        @url += JSON.parse(response.body)['posters'][0]['file_path']
        movie.tittle + ' : ' + @url }
    end
  end

  def get_budgets
    File.open('budgets.yml', 'w+') do |f|
      f.write all.map{|movie|  doc = Nokogiri::HTML(HTTParty.get(movie.link))
      divs = doc.css("div[class='txt-block']").text
      budget = /Budget:.\d{1,3}.\d{1,3}.\d{1,3}/.match(divs).to_s[7..25]
      if budget != nil
      	movie.tittle + ' : ' + budget
      else
      	movie.tittle + ' : nil'
      end}
    end
  end
end