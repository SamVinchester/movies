require 'csv'
require 'date'
require 'money'
require 'haml'
require 'httparty'
require 'nokogiri'
require 'open-uri'
puts JSON.parse(YAML.load_file('posters.yml').inspect).first