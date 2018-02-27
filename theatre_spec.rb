require "./movie.rb"
require "./movie_collection.rb"
require "./theatre.rb"
require 'rspec'

describe Theatre do
  
  before(:all) do
    @theatre = Theatre.new("movies.txt")
  end

  it '.show' do
    expect(@theatre.show("The Terminator")).to eq("Now showing: The Terminator " + Time.now.strftime("%T") + " - " + (Time.now + (107 * 60)).strftime("%T"))
  end

  it '.show(time)' do
  	expect(@theatre.show("06:20")).to eq("Now showing: Casablanca " + Time.now.strftime("%T") + " - " + (Time.now + (102 * 60)).strftime("%T"))
  end

  it '.when?' do
  	expect(@theatre.when?("The Terminator")).to eq("You can watch this movie at any time")
  end

end