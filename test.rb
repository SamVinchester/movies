require 'yaml'
require 'json'

thing = YAML.load_file('posters.yml')
puts JSON.parse(thing.inspect).class