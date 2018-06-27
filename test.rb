#class PeriodBuilder
#  def initialize(&block)
#    @array = []
#    if block_given?
#      context = PeriodBuilder.new
#      context.instance_eval &block
#    end
#  end
#  def method_missing name, arg
#    mini = [name, arg]
#    @array.push(mini)
#    puts @array
#  end
#end
#builder = PeriodBuilder.new {
#  description 'Blah'
#  filters genre: 'Comedy', years: 2001..2003
#  price 10
#}
#data = builder.to_h

class PeriodBuilder
  def initialize
    @hash = {}
  end
  def description (arg)
    @hash[:description] = arg
  end
  def to_h
    @hash
  end
end
builder = PeriodBuilder.new
builder.description 'Blah'
p builder.to_h
