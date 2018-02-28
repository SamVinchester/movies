require "./movie.rb"
require "./movie_collection.rb"
require "./theatre.rb"

describe Theatre do
  let(:theatre) { Theatre.new("movies.txt") }
  describe '#show' do
  	context 'when showing some film' do
  	  subject { theatre.show("The Terminator")}
  	  it { is_expected.to eq "Now showing: The Terminator " + Time.now.strftime("%T") + " - " + (Time.now + (107 * 60)).strftime("%T")}
    end

  	context 'when showing at morning' do
  	  subject { theatre.show('20:00') }
  	  it {is_expected.to eq "Now showing: Casablanca " + Time.now.strftime("%T") + " - " + (Time.now + (102 * 60)).strftime("%T")}
    end 
  end
end
#describe Theatre do  
#  before(:all) do
#    @theatre = Theatre.new("movies.txt")
#  end

#  it '.show' do
#    expect(@theatre.show("The Terminator")).to eq("Now showing: The Terminator " + Time.now.strftime("%T") + " - " + (Time.now + (107 * 60)).strftime("%T"))
#  end

#  it '.show(time)' do
#  	expect(@theatre.show("06:20")).to eq("Now showing: Casablanca " + Time.now.strftime("%T") + " - " + (Time.now + (102 * 60)).strftime("%T"))
#  end

#  it '.when?' do
#  	expect(@theatre.when?("The Terminator")).to eq("You can watch this movie at any time")
#  end

#end