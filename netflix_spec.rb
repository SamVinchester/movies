require "./demo.rb"
require "./movie.rb"
require "./movie_collection.rb"
require "./netflix.rb"
require 'rspec'

describe Netflix do
  it '.show' do
    netflix = Netflix.new
    netflix.show.should include("Now showing: ")
  end
end