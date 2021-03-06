require '../movie.rb'
require '../movie_collection.rb'
require '../theatre.rb'
require '../ancient_movie.rb'
require '../classic_movie.rb'
require '../modern_movie.rb'
require '../new_movie.rb'
require 'timecop'
require '../cashbox.rb'

describe Theatre do
  let(:theatre) { Theatre.new('movies.txt') }
  let(:theatre2) { Theatre.new('movies.txt') }
  describe '#show' do
    before do
      Timecop.freeze(Time.now)
    end

    context 'when showing at morning' do
      it 'calls filters' do
        expect(theatre).to receive(:filter).with(period: /ancient|classic/).and_call_original
        theatre.show('09:00')
      end
    end

    context 'when using filters' do
      subject { theatre.show('01:00') }
      it { expect { subject }.to output('Now showing: Django Unchained - novelty, premiere 6 years ago!' + ' ' + Time.now.strftime('%T') + ' - ' + (Time.now + (165 * 60)).strftime('%T') + "\n").to_stdout }
    end

    context 'when showing at night' do
      subject { theatre.show('03:00') }
      it { expect { subject }.to output("At this time movie is not shown\n").to_stdout }
    end

    context 'when using incorrect time' do
      subject { theatre.show('2222') }
      it { expect { subject }.to raise_error('Incorrect time!') }
    end
  end

  describe '#when?' do
    context 'using when?' do
      subject { theatre.when?('The Terminator') }
      it { is_expected.to eq 'You can watch this movie at any time' }
    end
  end

  describe '#buy_ticket' do
    before { theatre.cash }

    context 'when buy ticket' do
      it { expect { theatre.buy_ticket('Psycho', '09:00') }.to change { theatre.cash }.by(300) }
    end

    context 'when add cash' do
      subject { theatre.buy_ticket('Psycho', '09:00') }
      it { expect { subject }.to change { theatre.cash }.by(+300) }
    end

    context 'when buy ticket' do
      subject { theatre.buy_ticket('Psycho', '09:00') }
      it { is_expected.to eq 'You bought ticket on Psycho' }
    end
  end

  describe '#take(who)' do
    context 'when bank take money' do
      subject { theatre.take('Bank') }
      it { expect { subject }.to change { theatre.cash }.by(0) }
    end
  end
end