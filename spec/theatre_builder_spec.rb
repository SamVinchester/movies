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
  let(:theatre_builder) { Theatre::TheatreBuilder.new }
  let(:period_builder) { Theatre::PeriodBuilder.new }

  describe '#testing' do
    context 'when periods and halls intersection' do
      before { theatre_builder.period('16:00'..'20:00') {filters(genre: ['Action', 'Drama'], year: 2007..Time.now.year); price(20); hall(:red, :blue)}}
      before { theatre_builder.period('19:00'..'22:00') {filters(year: 1900..1945, exclude_country: 'USA'); price(30); hall(:red)}}
      subject { theatre_builder.testing }
      it { expect { subject }.to raise_error('Incorrect schedule!') }
    end

    context ' when only periods intersection' do
      before { theatre_builder.period('16:00'..'20:00') {filters(genre: ['Action', 'Drama'], year: 2007..Time.now.year); price(20); hall(:red, :blue)}}
      before { theatre_builder.period('19:00'..'22:00') {filters(year: 1900..1945, exclude_country: 'USA'); price(30); hall(:green)}}
      subject { theatre_builder.testing }
      it { expect(subject).to include({[:red, :blue]=>20, [:green]=>30})}
    end
  end

  describe '#period' do
    context 'when schedule saved' do
      subject{theatre_builder.period('19:00'..'22:00'){filters(genre: 'Comedy', year: 1900..1980); price(10); hall(:red, :blue)}}
      it { expect(subject).to include({"19:00".."22:00"=>{:filters=>{:genre=>"Comedy", :year=>1900..1980}, :price=>10, :hall=>[:red, :blue]}})}
    end

    context 'when create PeriodBuilder class' do
      it 'call' do
      	expect(Theatre::PeriodBuilder).to receive(:new).and_return(Theatre::PeriodBuilder.new)
      	theatre_builder.period('19:00'..'22:00'){filters(genre: 'Comedy', year: 1900..1980); price(10); hall(:red, :blue)}
      end


      #subject {theatre_builder.period('19:00'..'22:00'){filters(genre: 'Comedy', year: 1900..1980); price(10); hall(:red, :blue)}}
      #it { expect(subject).to receive(:new).and_return(Theatre::PeriodBuilder.new)}
    end

    context 'when block not given' do
      subject {theatre_builder.period('19:00'..'22:00')}
      it {expect{subject}.to raise_error('No block given')}
    end
  end

  describe '#create_cost' do
    context 'when create hash with cost' do
      before { theatre_builder.period('19:00'..'22:00') {filters(year: 1900..1945, exclude_country: 'USA'); price(30); hall(:green)}}
      subject{theatre_builder.create_cost}
      it { expect(subject).to include({"19:00".."22:00"=>30})}
    end
  end
end