require_relative 'downloader.rb'
#require_relative 'netflix.rb'
#require_relative 'movie_collection.rb'

download = Downloader.new(ARGV[0] || 'movies.txt')
download.get_budgets