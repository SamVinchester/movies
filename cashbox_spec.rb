require "./empty.rb"

describe Cashbox do
  let(:empty) { Empty.new }

  describe '#cash' do
  	context 'when using #cash' do
  	  subject { empty.cash }
  	  it { is_expected.to eq 0 }
  	end
  end

  describe '#take(who)' do
  	before { empty.cash }
  	context 'when #take correct' do
  	  subject { empty.take("Bank") }
  	  it { is_expected. to eq "Encashment complete!"}
  	end

  	context 'when noname take money' do
  	  subject { empty.take("Johny") }
  	  it { expect { subject }.to raise_error(RuntimeError, "Unknown collector! Calling to police...") }
  	end
  end
end