require_relative 'cashbox.rb'
require 'money'
require 'ruby-progressbar'

class Netflix < MovieCollection
  include Enumerable
  extend Cashbox

  def initialize(arg)
    super
    @balance = 0
    @custom_filters = { }
    @new_filter = { }
  end

  attr_accessor :balance

  def pay(cents)
    raise 'Incorrect pay' unless cents.is_a?(Integer)
    @balance += cents
    self.class.pay(cents)
  end

  def user_filter(filters = { }, &block)
    custom, internal = filters.partition { |name, _| @custom_filters.has_key?(name) }
    films = filter(internal.to_h)
    films = custom.reduce(films){|coll, filter| coll.select{|movie| (@custom_filters[filter[0]]).call(movie, filter[1])} }
    return films unless block_given?
    films.select { |movie| yield(movie, @year) }
  end

  def show(filters = { }, &block)
    @movie = user_filter(filters , &block).sample
    puts 'Now showing: ' + @movie.to_s
    raise ArgumentError, 'not enough money!' unless @balance >= @movie.cost
    @balance -= @movie.cost
  end

  def define_filter(filter_name, from: nil, arg: 0, &block)
    raise 'from: Incorrect filter' if from && !@custom_filters.has_key?(from)
    @custom_filters[filter_name] = from ? proc { |movie| @custom_filters[from].call(movie, arg) } : block
  end

  def by_genre
    CopyCollection.new(self)
  end

  def by_country
    CopyCollection.new(self)
  end

  def table_create
    template = File.read('template.haml')
    output = Haml::Engine.new(template).render(Movie.new, :movies => all, :poster => poster, :budget => budgets)
    puts output
    File.open('template.html', 'w+') do |f|
      f.write output
    end
  end

  def get_images #получаем массив ссылок на постеры
    urls = []
    all.select{|movie| id = movie.link[22..30];
    url = 'https://image.tmdb.org/t/p/w200/'
    response = HTTParty.get('https://api.themoviedb.org/3/movie/' + id + '/images?api_key=d83731a8549bd375936b9779a5b6bb0d')
    #progressbar = ProgressBar.create(:title => "Getting posters", :starting_at => 0, :total => 200)
    url += JSON.parse(response.body)['posters'][0]['file_path']
    urls.push(url)}
    File.open('posters.yml', 'w+') do |f|
      f.write urls
    end
  end

  def get_budgets
    budgets = []
    all.each{|movie|  doc = Nokogiri::HTML(open(movie.link))
    divs = doc.css("div[class='txt-block']").text
    budget = /Budget:.\d{1,3}.\d{1,3}.\d{1,3}/.match(divs)
    budget = '        unknown budget' if budget == nil
    budgets.push(budget.to_s[7..25])}
    File.open('budgets.yml', 'w+') do |f|
      f.write budgets
    end
  end

  def budgets
    thing = YAML.load_file('budgets.yml')
    budgets = JSON.parse(thing.inspect)
    all.zip(budgets).to_h
  end

  def poster
    thing = YAML.load_file('posters.yml')
    posters = JSON.parse(thing.inspect)
    all.zip(posters).to_h
  end

  def how_much?(arg)
    @mov_arr.map do |film|
      if film.tittle == arg
        if film.period == 'ancient'
          'cost of the film is 1$'
        elsif film.period == 'classic'
          'cost of the film is 1.5$'
        elsif film.period == 'modern'
          'cost of the film is 3$'
        elsif film.period == 'new'
          'cost of the film is 5$'
        end
      end
    end .compact.join
  end
end
