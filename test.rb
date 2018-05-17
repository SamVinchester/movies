require 'virtus'

class User
  include Virtus.model

  attribute :name, String
  attribute :age, Integer
  attribute :birthday, DateTime
end

user = User.new(:name => 'Piotr', :age => 29)
p user.attributes # => { :name => "Piotr", :age => 29 }

user.name # => "Piotr"

user.age = '29' # => 29
user.age.class # => Fixnum

user.birthday = 'November 18th, 1983' # => #<DateTime: 1983-11-18T00:00:00+00:00 (4891313/2,0/1,2299161)>

# mass-assignment
user.attributes = { :name => 'Jane', :age => 21 }
user.name # => "Jane"
user.age  # => 21