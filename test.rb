require './empty.rb'
describe Cashbox do
  let(:empty) { Empty.new }

  describe '#pay' do
    context 'when pay 100' do
      subject { empty.pay(100) }
      it { expect { subject }.to change { empty.money }.by(+100) }
    end

    context 'when incorrect pay' do
      subject { empty.pay('Nothing') }
      it { expect { subject }.to raise_error(RuntimeError, 'Incorrect pay') }
    end
  end
end
