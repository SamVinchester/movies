require '../movie.rb'
require '../movie_collection.rb'
require '../netflix.rb'
require '../ancient_movie.rb'
require '../classic_movie.rb'
require '../modern_movie.rb'
require '../new_movie.rb'
require '../cashbox.rb'

describe Netflix do
  before { Netflix.cash }
  let(:netflix) { Netflix.new('movies.txt') }
  let(:netflix2) { Netflix.new('movies.txt') }
  describe '#show' do
    before { netflix.pay(100) }

    context 'when showing some film' do
      subject { netflix.show(genre: 'Western', period: 'new') }
      it { expect { subject }.to change { netflix.balance }.by(-5) }
    end

    context 'when using filters' do
      it 'calls filters' do
        expect(netflix).to receive(:filter).with(genre: 'Western', period: 'new').and_call_original
        netflix.show(genre: 'Western', period: 'new')
      end
    end

    context 'when using filters' do
      subject { netflix.show(genre: 'Western', period: 'new') }
      it { expect { subject }.to output('Now showing: Django Unchained - novelty, premiere 6 years ago!' + ' ' + Time.now.strftime('%T') + ' - ' + (Time.now + (165 * 60)).strftime('%T') + "\n").to_stdout }
    end

    context 'call user_filter' do
      before { netflix.define_filter(:new_sci_fi) { |movie, year| movie.year > year && !movie.tittle.include?('Terminator') } }
      it ' call user_filter' do
        expect(netflix).to receive(:user_filter).and_call_original
        netflix.show(new_sci_fi: 2010)
      end
    end

    context 'when block given' do
      subject { netflix.show {|movie| movie.genre.include?('Western') && movie.year > 2010} }
      it { expect{ subject }.to output('Now showing: Django Unchained - novelty, premiere 6 years ago!' + ' ' + Time.now.strftime('%T') + ' - ' + (Time.now + (165 * 60)).strftime('%T') + "\n").to_stdout }
    end
  end

  describe '#user_filter' do
    context 'when block given' do
      subject { netflix.user_filter { |movie| movie.genre.include?('Western') && movie.year > 2010 }}
      it { expect(subject).to all(have_attributes(:period => 'new', :genre => ['Western'])) }
    end

    context 'when user filter given' do
      before { netflix.define_filter(:new_sci_fi) { |movie, year| movie.year > year && !movie.tittle.include?('Terminator') } }
      subject { netflix.user_filter(new_sci_fi: 2005) }
      it { expect(subject).to all(have_attributes(:period => 'new')) }
    end

    context ' when user filter && block given' do
      before { netflix.define_filter(:new_sci_fi) { |movie, year| movie.year > year } }
      subject { netflix.user_filter(new_sci_fi: 2000) {|movie| movie.genre.include?('Western')} }
      it { expect(subject).to all(have_attributes(:period => 'new', :genre => ['Western'])) }
    end
  end

  describe '#define_filter' do
    let(:filters) {netflix.define_filter(:new_sci_fi) { |movie, year| movie.year > year && !movie.tittle.include?('Terminator') }}
    context 'when user save filter' do
      subject { filters }
      it { is_expected.to include(:new_sci_fi)}
      #subject { filters }
      #it { is_expected.to all(have_attributes(:new_sci_fi => Proc))}
    end
  end

  describe '#pay' do
    before { Netflix.cash }

    context 'when pay netflix' do
      it {
        expect do
          netflix.pay(20)
          netflix2.pay(40)
        end .to change { Netflix.cash }.by(+60)
      }
    end

    context 'when pay 100' do
      subject { netflix.pay(100) }
      it { expect { subject }.to change { netflix.balance }.by(+100) }
    end

    context 'when incorrect pay' do
      subject { netflix.pay('Nothing') }
      it { expect { subject }.to raise_error(RuntimeError, 'Incorrect pay') }
    end
  end

  describe '#how_much?' do
    context 'when useing how_much' do
      subject { netflix.how_much?('The Terminator') }
      it { is_expected.to eq 'cost of the film is 3$' }
    end
  end
end
