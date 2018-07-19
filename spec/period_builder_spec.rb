require '../movie.rb'
require '../movie_collection.rb'
require '../theatre.rb'
require '../ancient_movie.rb'
require '../classic_movie.rb'
require '../modern_movie.rb'
require '../new_movie.rb'
require 'timecop'
require '../cashbox.rb'

describe Theatre::PeriodBuilder do
  let(:period) { Theatre::PeriodBuilder.new }

  describe '#description' do
    context 'when given true args' do
      subject{period.description('Вечерний сеанс')}
      it{ expect(subject).to include(:description => 'Вечерний сеанс')}
    end
  end

  describe '#filters' do
    context 'when given true args' do
      subject{period.filters('Comedy')}
      it{ expect(subject).to include(:filters => 'Comedy')}
    end
  end

  describe '#price' do
    context 'when given true args' do
      subject{period.price(20)}
      it{ expect(subject).to include(:price => 20)}
    end
  end

  describe '#hall' do
    context 'when given true args' do
      subject{period.hall(:red, :blue)}
      it{ expect(subject).to include(:hall => [:red, :blue])}
    end
  end

  describe '#tittle' do
    context 'when given true args' do
      subject{period.tittle('The Terminator')}
      it{ expect(subject).to include(:tittle => 'The Terminator')}
    end
  end

  describe '#.to_hash' do
    context 'when save true results' do
      before {period.price(10)}
      before {period.tittle('The Terminator')}
      before {period.hall(:green)}
      subject{period.to_hash('09:00'..'10:00')}
      it{ expect(subject).to include('09:00'..'10:00' => {:price=>10, :tittle => 'The Terminator', :hall=>[:green]})}
    end

    context 'when price is not given' do
      before {period.tittle('The Terminator')}
      before {period.hall(:green)}
      subject{period.to_hash('09:00'..'10:00')}
      it{ expect{subject}.to raise_error('price is not specified') }
    end

    context 'when filters or tittle is not given' do
      before {period.price(10)}
      before {period.hall(:green)}
      subject{period.to_hash('09:00'..'10:00')}
      it{ expect{subject}.to raise_error('filters is not specified') }
    end

    context 'when halls is not given' do
      before {period.price(10)}
      before {period.tittle('The Terminator')}
      subject{period.to_hash('09:00'..'10:00')}
      it{ expect{subject}.to raise_error('hall is not specified') }
    end
  end
end