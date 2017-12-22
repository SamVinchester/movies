require "./movie.rb"
require "./movie_collection.rb"
require "./netflix.rb"
require 'rspec'

describe Netflix do

  before(:all) do
    @netflix = Netflix.new("movies.txt")
  end

  it 'starting balance' do
    @balance = @netflix.balance
    expect(@balance).to eq(0)
  end

  it '.pay' do
    expect(@netflix.pay(25)).to eq(@netflix.balance)
  end

  it '.show ancient film' do
    @balance = @netflix.balance
    expect(@balance).to eq(@balance-1)
    expect(@netflix.show("Casablanca")).to eq("Now showing: " + "Casablanca - old film(1942 year)" + " " + Time.now.strftime("%T") + " - " + (Time.now + (102 * 60)).strftime("%T"))
  end

  it '.show classic film' do
    expect(@netflix.show("Diabolique")).to eq("Now showing: " + "Diabolique - classic film, producer Henri-Georges Clouzot (The Wages of Fear)" + " " + Time.now.strftime("%T") + " - " + (Time.now + (116 * 60)).strftime("%T"))
  end

  it '.show modern film' do
    expect(@netflix.show("Jurassic Park")).to eq("Now showing: " + "Jurassic Park - modern movie, actors Sam Neill, Laura Dern, Jeff Goldblum" + " " + Time.now.strftime("%T") + " - " + (Time.now + (127 * 60)).strftime("%T"))
  end

  it '.show new film' do
    expect(@netflix.show("Prisoners")).to eq("Now showing: " + "Prisoners - novelty, premiere 4 years ago! " + Time.now.strftime("%T") + " - " + (Time.now + (153 * 60)).strftime("%T"))
  end

  it '.show filter' do
    expect(@netflix.show(genre: 'Western', period: 'new')).to eq("Now showing: Django Unchained - novelty, premiere 5 years ago!" + " " + Time.now.strftime("%T") + " - " + (Time.now + (165 * 60)).strftime("%T"))
  end

end