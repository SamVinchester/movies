require 'erb'

p weekday = Time.now.strftime('%A')
p simple_template = "Today is <%= weekday %>."
puts renderer = ERB.new(simple_template)
p renderer.class
puts output = renderer.result()
