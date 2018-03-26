require "./movie.rb"
require "./movie_collection.rb"
require "./netflix.rb"
require "./ancient_movie.rb"
require "./classic_movie.rb"
require "./modern_movie.rb"
require "./new_movie.rb"

describe Netflix do
  before { Netflix.cash }
  let(:netflix) { Netflix.new("movies.txt") }
  describe '#show' do
    before { netflix.pay(100) }

    context 'when showing some film' do
      subject { netflix.show(genre: "Western", period: "new") }
      it { expect { subject }.to change{netflix.balance}.by(-5) }
    end

    context 'when using filters' do
      it 'calls filters' do
        expect(netflix).to receive(:filter).with(genre: "Western", period: "new").and_call_original
        netflix.show(genre: "Western", period: "new")
      end
    end

    context 'when using filters' do
      subject { netflix.show(genre: "Western", period: "new") }
      it { expect { subject }.to output("Now showing: Django Unchained - novelty, premiere 6 years ago!" + " " + Time.now.strftime("%T") + " - " + (Time.now + (165 * 60)).strftime("%T") + "\n").to_stdout}
    end
    
  end

  describe '#pay' do
    before { Netflix.cash }
    context 'when pay 100' do
      subject { netflix.pay(100) }
      it { expect { subject }.to change{netflix.balance}.by(+100) }
    end

    context 'when incorrect pay' do
      subject { netflix.pay("Nothing") }
      it { expect { subject }.to raise_error(RuntimeError, "Incorrect pay")}
    end
  end

  describe '#how_much?' do
    context 'when useing how_much' do
      subject { netflix.how_much?("The Terminator")}
      it { is_expected.to eq "cost of the film is 3$"}
    end
  end
end