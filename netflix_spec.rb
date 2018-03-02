require "./movie.rb"
require "./movie_collection.rb"
require "./netflix.rb"

describe Netflix do
  let(:netflix) { Netflix.new("movies.txt") }
  describe '#show' do
    before { netflix.pay(100) }
    context 'when showing ancient film' do
      subject { netflix.show("Casablanca") }
      it { is_expected.to eq "Now showing: Casablanca - old film(1942 year)" + ' ' + Time.now.strftime("%T") + " - " + (Time.now + (102 * 60)).strftime("%T")}
    end

    context 'when showing classic film' do
      subject { netflix.show("Diabolique") }
      it { is_expected.to eq "Now showing: " + "Diabolique - classic film, producer Henri-Georges Clouzot (The Wages of Fear)" + " " + Time.now.strftime("%T") + " - " + (Time.now + (116 * 60)).strftime("%T")}
    end

    context 'when showing modern film' do
      subject { netflix.show("Jurassic Park") }
      it { is_expected.to eq "Now showing: " + "Jurassic Park - modern movie, actors Sam Neill, Laura Dern, Jeff Goldblum" + " " + Time.now.strftime("%T") + " - " + (Time.now + (127 * 60)).strftime("%T")}
    end

    context 'when showing new film' do
      subject { netflix.show("Prisoners") }
      it { is_expected.to eq "Now showing: " + "Prisoners - novelty, premiere 4 years ago! " + Time.now.strftime("%T") + " - " + (Time.now + (153 * 60)).strftime("%T")}
    end

    context 'when showing some film' do
      subject { netflix.show(genre: "Western", period: "new") }
      it { expect { subject }.to change{netflix.balance}.by(-5) }
    end

    context 'when using filters' do
      it 'calls filters' do
        expect(netflix).to receive(:filter).with(genre: "Western", period: "new").and_call_original
        netflix.show(genre: "Western", period: "new")
      end
    end

    context 'when using filters' do
      subject { netflix.show(genre: "Western", period: "new") }
      it { expect { subject }.to output("Now showing: Django Unchained - novelty, premiere 5 years ago!" + " " + Time.now.strftime("%T") + " - " + (Time.now + (165 * 60)).strftime("%T") + "\n").to_stdout}
    end
    
  end

  describe '#pay' do
    context 'when pay' do
      subject { netflix.pay(25) }
      it {is_expected.to eq netflix.balance}
    end
  end

  describe '#how_much?' do
    context 'when useing how_much' do
      subject { netflix.how_much?("The Terminator")}
      it { is_expected.to eq "cost of the film is 3$"}
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