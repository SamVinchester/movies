require "./movie.rb"
require "./movie_collection.rb"
require "./netflix.rb"
require 'rspec'

describe Netflix do
  it '.show' do
    netflix = Netflix.new("movies.txt")
    expect(netflix.show("Akira")).to eq("Now showing: " + "Akira" + " " + Time.now.strftime("%T") + " - " + (Time.now + (124 * 60)).strftime("%T"))
  end
end