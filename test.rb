names = [ 'Sam', 'John', 'Kevin', 'Martin' ]
proc = Proc.new do |name, length|
  name.length >= length
end
length = 4
puts names.select{|name| proc.call(name, length) }