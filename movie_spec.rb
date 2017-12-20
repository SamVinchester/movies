require "./movie.rb"
require 'rspec'
describe Movie do
    it "has four period" do
        movie = Movie.new({:link => "http://imdb.com/title/tt0034583/?ref_=chttp_tt_32", :tittle => "Casablanka",  :year => "1942", :country => "USA", :date => "1943-01-23", :genre => "Drama,Romance,War", :time => "102 min", :raiting => "8.6", :producer => "Michael Curtiz", :actors => "Humphrey Bogart,Ingrid Bergman,Paul Henreid"}, "collection")
        expect(movie.period).to eq("ancient")
    end

    it "has four period" do
        movie = Movie.new({:link => "http://imdb.com/title/tt0034583/?ref_=chttp_tt_32", :tittle => "Casablanka",  :year => "1950", :country => "USA", :date => "1943-01-23", :genre => "Drama,Romance,War", :time => "102 min", :raiting => "8.6", :producer => "Michael Curtiz", :actors => "Humphrey Bogart,Ingrid Bergman,Paul Henreid"}, "collection")
        expect(movie.period).to eq("classic")
    end

    it "has four period" do
        movie = Movie.new({:link => "http://imdb.com/title/tt0034583/?ref_=chttp_tt_32", :tittle => "Casablanka",  :year => "1970", :country => "USA", :date => "1943-01-23", :genre => "Drama,Romance,War", :time => "102 min", :raiting => "8.6", :producer => "Michael Curtiz", :actors => "Humphrey Bogart,Ingrid Bergman,Paul Henreid"}, "collection")
        expect(movie.period).to eq("modern")
    end

    it "has four period" do
        movie = Movie.new({:link => "http://imdb.com/title/tt0034583/?ref_=chttp_tt_32", :tittle => "Casablanka",  :year => "2005", :country => "USA", :date => "1943-01-23", :genre => "Drama,Romance,War", :time => "102 min", :raiting => "8.6", :producer => "Michael Curtiz", :actors => "Humphrey Bogart,Ingrid Bergman,Paul Henreid"}, "collection")
        expect(movie.period).to eq("new")
    end

end