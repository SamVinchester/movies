require "./movie.rb"
require "./movie_collection.rb"
require "./theatre.rb"
require "./ancient_movie.rb"
require "./classic_movie.rb"
require "./modern_movie.rb"
require "./new_movie.rb"
require "timecop"

describe Theatre do
  let(:theatre) { Theatre.new("movies.txt") }
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
      subject { theatre.show("01:00") }
      it { expect { subject }.to output("Now showing: Django Unchained - novelty, premiere 6 years ago!" + " " + Time.now.strftime("%T") + " - " + (Time.now + (165 * 60)).strftime("%T") + "\n").to_stdout}
    end

    context 'when showing at night' do
      subject { theatre.show("03:00") }
      it { expect { subject }.to output("At this time movie is not shown\n").to_stdout }
    end

    context 'when using incorrect time' do
      subject { theatre.show("2222") }
      it { expect { subject }.to output("Incorrect time!\n").to_stdout }
    end
  end

  describe'#when?' do
  	context 'using when?' do
  	  subject { theatre.when?("The Terminator") }
  	  it { is_expected.to eq "You can watch this movie at any time" }
  	end
  end
end
#describe Theatre do  
#  before(:all) do
#    @theatre = Theatre.new("movies.txt")theat
#  end

# it '.show' do
#    expect(@theatre.show("The Terminator")).to eq("Now showing: The Terminator " + Time.now.strftime("%T") + " - " + (Time.now + (107 * 60)).strftime("%T"))
#  end

#  it '.show(time)' do
#  	expect(@theatre.show("06:20")).to eq("Now showing: Casablanca " + Time.now.strftime("%T") + " - " + (Time.now + (102 * 60)).strftime("%T"))
#  end

#  it '.when?' do
#  	expect(@theatre.when?("The Terminator")).to eq("You can watch this movie at any time")
#  end
#end