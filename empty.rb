$LOAD_PATH << '.'
require 'cashbox.rb'
class Empty

include Cashbox

attr_accessor :money
@money = 0

end