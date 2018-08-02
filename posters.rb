require_relative 'downloader.rb'

download = Downloader.new(ARGV[0] || 'movies.txt')
download.get_images