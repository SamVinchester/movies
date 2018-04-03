def testing(arg)
  puts 'value is a ' + arg.values[0].to_s if p arg.values[0].class == Integer
end
testing(bbb: 2010)
