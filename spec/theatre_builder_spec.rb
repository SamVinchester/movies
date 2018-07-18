require '../movie.rb'
require '../movie_collection.rb'
require '../theatre.rb'
require '../ancient_movie.rb'
require '../classic_movie.rb'
require '../modern_movie.rb'
require '../new_movie.rb'
require 'timecop'
require '../cashbox.rb'

describe Theatre::TheatreBuilder do
  let(:builder) { Theatre::TheatreBuilder.new }

  describe '#testing' do
    context 'when periods and halls intersection' do
      before { builder.period('16:00'..'20:00') {hall :red, :blue}}
      before { builder.period('19:00'..'22:00') {hall :red}}
      subject { builder.testing }
      it { expect { subject }.to raise_error('Incorrect schedule!') }
    end

    context ' when only periods intersection' do
      before { builder.period('16:00'..'20:00') {hall :red, :blue; price 20}}
      before { builder.period('19:00'..'22:00') {hall :green; price 30}}
      subject {builder.testing}
      it { expect(subject).to be_a(Hash)}#have_attributes([:red, :blue]=>20, [:green]=>30) }
    end
  end

  describe '#period' do
    context 'when use period with block' do
      subject{builder.period('19:00'..'22:00') {price 30}}
      it { expect(subject).to be_a(Array)}
    end
  end

  describe '#create_cost' do
    context 'when create hash with cost' do
      before { builder.period('16:00'..'20:00') {hall :red, :blue; price 20}}
      subject{builder.create_cost}
      it { expect(subject).to contain_exactly(["16:00".."20:00", 20])}#have_attributes("09:00".."11:00"=>10)}#be_a(Hash)}
    end
  end
end