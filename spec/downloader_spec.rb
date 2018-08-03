require '../movie.rb'
require '../movie_collection.rb'
require '../ancient_movie.rb'
require '../classic_movie.rb'
require '../modern_movie.rb'
require '../new_movie.rb'
require '../downloader.rb'
require 'webmock'

include WebMock::API

describe Downloader do
  
  let(:downloader) { Downloader.new(ARGV[0] || 'movies.txt') }
  
  describe '#get_images' do
    context 'when creating new file' do

    end
  end

end