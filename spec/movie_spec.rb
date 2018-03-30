require '../movie.rb'

describe Movie do
  describe '#period' do
    subject { movie.period }
    let(:movie) do
      Movie.new({
                  link: 'http://imdb.com/title/tt0034583/?ref_=chttp_tt_32',
                  tittle: 'Casablanca',
                  year: year,
                  country: 'USA',
                  date: '1943-01-23',
                  genre: 'Drama,Romance,War',
                  time: '102 min',
                  raiting: '8.6',
                  producer: 'Michael Curtiz',
                  actors: 'Humphrey Bogart,Ingrid Bergman,Paul Henreid'
                },
                collection)
    end
    let(:collection) { double }

    context 'when period is ancient' do
      let(:year) { 1910 }
      it { is_expected.to eq 'ancient' }
    end

    context 'when period is classic' do
      let(:year) { 1950 }
      it { is_expected.to eq 'classic' }
    end

    context 'when period is modern' do
      let(:year) { 1972 }
      it { is_expected.to eq 'modern' }
    end

    context 'when period is new' do
      let(:year) { 2015 }
      it { is_expected.to eq 'new' }
    end
  end
end