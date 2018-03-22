require "./movie.rb"
require "./movie_collection.rb"
require "./theatre.rb"
require "./netflix.rb"
require "./ancient_movie.rb"
require "./classic_movie.rb"
require "./modern_movie.rb"
require "./new_movie.rb"
require "timecop"
require "cashbox.rb"

describe Cashbox do
  let(:netflix) { Netflix.new("movies.txt") }
  let(:theatre) { Theatre.new("movies.txt") }

  describe '#cash' do
  	context 'when using #cash' do
  	  subject { theatre.cash }
  	  it { is_expected.to eq 10000}
  	end
  end

  describe '#pay' do
  	context 'when pay 100' do
  	  subject { netflix.pay(100) }
  	  it { expect { subject }.to change{netflix.money}.by(+100) }
  	end

  	context 'when incorrect pay' do
  	  subject { netflix.pay("Nothing") }
  	  it { expect { subject }.to raise_error(RuntimeError, "Incorrect pay")}
  	end
  end

  describe '#buy_ticket' do
    context 'when add cash' do
      subject { theatre.buy_ticket("Psycho", "09:00") }
      it { expect { subject }.to change{theatre.money}.by(+300) }
    end

    context 'when buy ticket' do
      subject { theatre.buy_ticket("Psycho", "09:00") }
      it { is_expected. to eq "You bought ticket on Psycho" }
    end
  end

  describe '#take(who)' do
  	context 'when #take correct' do
  	  subject { theatre.take("Bank") }
  	  it { is_expected. to eq "Encashment complete!"}
  	end

  	context 'when bank take money' do
  	  subject { theatre.take("Bank") }
  	  it { expect { subject }.to change{theatre.money}.by(-10000) }
  	end

  	context 'when noname take money' do
  	  subject { theatre.take("Johny") }
  	  it { expect { subject }.to raise_error(RuntimeError, "Unknown collector! Calling to police...") }
  	end
  end

end