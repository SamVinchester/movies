require "./netflix.rb"
require "./movie_collection.rb"
require "./movie.rb"
require 'rspec'

describe Netflix do
  it '.show' do
    expect(netflix.show("Akira")).to eq 'Now showing: '
  end
end