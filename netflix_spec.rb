require "./movie.rb"
require "./movie_collection.rb"
require "./netflix.rb"

describe Netflix do
  describe '#show' do
    subject { netflix.show("Casablanca") }
    let(:netflix) { Netflix.new("movies.txt") }

    context 'when showing ancient film' do
      it { is_expected.to eq "Now showing: Casablanca - old film(1942 year)" + ' ' + Time.now.strftime("%T") + " - " + (Time.now + (102 * 60)).strftime("%T")}
    end
  end

  describe '#show' do
    subject { netflix.show("Diabolique") }
    let(:netflix) { Netflix.new("movies.txt") }

    context 'when showing classic film' do
      it { is_expected.to eq "Now showing: " + "Diabolique - classic film, producer Henri-Georges Clouzot (The Wages of Fear)" + " " + Time.now.strftime("%T") + " - " + (Time.now + (116 * 60)).strftime("%T")}
    end
  end

  describe '#show' do
    subject { netflix.show("Jurassic Park") }
    let(:netflix) { Netflix.new("movies.txt") }

    context 'when showing modern film' do
      it { is_expected.to eq "Now showing: " + "Jurassic Park - modern movie, actors Sam Neill, Laura Dern, Jeff Goldblum" + " " + Time.now.strftime("%T") + " - " + (Time.now + (127 * 60)).strftime("%T")}
    end
  end

  describe '#show' do
    subject { netflix.show("Prisoners") }
    let(:netflix) { Netflix.new("movies.txt") }

    context 'when showing new film' do
      it { is_expected.to eq "Now showing: " + "Prisoners - novelty, premiere 4 years ago! " + Time.now.strftime("%T") + " - " + (Time.now + (153 * 60)).strftime("%T")}
    end
  end  

end

#describe Netflix do

#  before(:all) do
#    @netflix = Netflix.new("movies.txt")
#  end

#  it 'starting balance' do
#    @balance = @netflix.balance
#    expect(@balance).to eq(0)
#  end

#  it '.pay' do
#    expect(@netflix.pay(25)).to eq(@netflix.balance)
#  end

#  it '.show ancient film' do
#    expect(@netflix.show("Casablanca")).to eq("Now showing: " + "Casablanca - old film(1942 year)" + " " + 
#      Time.now.strftime("%T") + " - " + (Time.now + (102 * 60)).strftime("%T")) 
#    expect{@netflix.show("Casablanca")}.to change{@netflix.balance}.by(-1)
    #expect{@netflix.show("Casablanca")}.to raise_error(RuntimeError)
#  end

#  it '.show classic film' do
#    expect(@netflix.show("Diabolique")).to eq("Now showing: " + "Diabolique - classic film, producer Henri-Georges Clouzot (The Wages of Fear)" + " " + Time.now.strftime("%T") + " - " + (Time.now + (116 * 60)).strftime("%T"))
#    expect{@netflix.show("Diabolique")}.to change{@netflix.balance}.by(-1.5)
#  end

#  it '.show modern film' do
#    expect(@netflix.show("Jurassic Park")).to eq("Now showing: " + "Jurassic Park - modern movie, actors Sam Neill, Laura Dern, Jeff Goldblum" + " " + Time.now.strftime("%T") + " - " + (Time.now + (127 * 60)).strftime("%T"))
#    expect{@netflix.show("Jurassic Park")}.to change{@netflix.balance}.by(-3)
#  end

#  it '.show new film' do
#    expect(@netflix.show("Prisoners")).to eq("Now showing: " + "Prisoners - novelty, premiere 4 years ago! " + Time.now.strftime("%T") + " - " + (Time.now + (153 * 60)).strftime("%T"))
#    expect{@netflix.show("Prisoners")}.to change{@netflix.balance}.by(-5)
#  end

#  it '.show filter' do
#    @netflix.pay(25)
    #expect{@netflix.show(genre: 'Western', period: 'new')}.to raise_error(RuntimeError, "not enough money!")
#    expect(@netflix.show(genre: 'Western', period: 'new')).to eq("Now showing: Django Unchained - novelty, premiere 5 years ago!" + " " + Time.now.strftime("%T") + " - " + (Time.now + (165 * 60)).strftime("%T"))
#    expect{@netflix.show(genre: 'Western', period: 'new')}.to change{@netflix.balance}.by(-5)
#  end

#  it '.how_much?' do
#    expect(@netflix.how_much?('The Terminator')).to eq("cost of the film is 3$")
#  end
  
#end