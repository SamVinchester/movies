require "./movie.rb"

describe Movie do
  describe '#period' do
    subject { movie.period }
    let(:movie) {
      Movie.new({
        link: "http://imdb.com/title/tt0034583/?ref_=chttp_tt_32",
        tittle: "Casablanca",
        year: year,
        country: "USA",
        date: "1943-01-23",
        genre: "Drama,Romance,War",
        time: "102 min",
        raiting: "8.6",
        producer: "Michael Curtiz",
        actors: "Humphrey Bogart,Ingrid Bergman,Paul Henreid"},
        collection)
    }
    let(:collection) { double }

    context 'when period is ancient' do
      let(:year) { 1910 }
      it { is_expected.to eq "ancient" }
    end

    context 'when period is classic' do
      let(:year) { 1950 }
      it { is_expected.to eq "classic" }
    end

    context 'when period is modern' do
      let(:year) { 1972 }
      it { is_expected.to eq "modern" }
    end

    context 'when period is new' do
      let(:year) { 2015 }
      it { is_expected.to eq "new" }
    end

  end
end

#describe Movie do
#    it "has four period" do
#        movie = Movie.new({:link => "http://imdb.com/title/tt0034583/?ref_=chttp_tt_32", :tittle => "Casablanka",  :year => "1942", :country => "USA", :date => "1943-01-23", :genre => "Drama,Romance,War", :time => "102 min", :raiting => "8.6", :producer => "Michael Curtiz", :actors => "Humphrey Bogart,Ingrid Bergman,Paul Henreid"}, "collection")
#        expect(movie.period).to eq("ancient")
#    end
#
#    it "has four period" do
#        movie = Movie.new({:link => "http://imdb.com/title/tt0034583/?ref_=chttp_tt_32", :tittle => "Casablanka",  :year => "1950", :country => "USA", :date => "1943-01-23", :genre => "Drama,Romance,War", :time => "102 min", :raiting => "8.6", :producer => "Michael Curtiz", :actors => "Humphrey Bogart,Ingrid Bergman,Paul Henreid"}, "collection")
#        expect(movie.period).to eq("classic")
#    end

#    it "has four period" do
#        movie = Movie.new({:link => "http://imdb.com/title/tt0034583/?ref_=chttp_tt_32", :tittle => "Casablanka",  :year => "1970", :country => "USA", :date => "1943-01-23", :genre => "Drama,Romance,War", :time => "102 min", :raiting => "8.6", :producer => "Michael Curtiz", :actors => "Humphrey Bogart,Ingrid Bergman,Paul Henreid"}, "collection")
#        expect(movie.period).to eq("modern")
#    end

#    it "has four period" do
#        movie = Movie.new({:link => "http://imdb.com/title/tt0034583/?ref_=chttp_tt_32", :tittle => "Casablanka",  :year => "2005", :country => "USA", :date => "1943-01-23", :genre => "Drama,Romance,War", :time => "102 min", :raiting => "8.6", :producer => "Michael Curtiz", :actors => "Humphrey Bogart,Ingrid Bergman,Paul Henreid"}, "collection")
#        expect(movie.period).to eq("new")
#    end

#end