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

  describe '#methods' do
    context 'when use #description' do
      subject{period.description('Вечерний сеанс')}
      it{ expect(subject).to include(:description => 'Вечерний сеанс')}
    end

    context 'when use #filters' do
      subject{period.filters('Comedy')}
      it{ expect(subject).to include(:filters => 'Comedy')}
    end

    context 'when use #price' do
      subject{period.price(20)}
      it{ expect(subject).to include(:price => 20)}
    end

    context 'when use #hall' do
      subject{period.hall(:red, :blue)}
      it{ expect(subject).to include(:hall => [:red, :blue])}
    end

    context 'when use #tittle' do
      subject{period.tittle('The Terminator')}
      it{ expect(subject).to include(:tittle => 'The Terminator')}
    end

    context 'when use #to_hash' do
      before {period.tittle('The Terminator')}
      subject{period.to_hash('09:00'..'10:00')}
      it{ expect(subject).to include('09:00'..'10:00' => {:tittle => 'The Terminator'})}
    end

  end
end