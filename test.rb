def testing(arg)
  if p arg.values[0].class == Integer
    puts 'value is a ' + arg.values[0].to_s
  end
end
testing(bbb: 2010)