require 'money'
module Cashbox

  attr_accessor(:money)

  def cash
    @money ||= Money.new(0, "USD").cents
  end

  def pay(cents)
    raise "Incorrect pay" unless cents.is_a?(Integer)
    @money += cents
  end

  def take (who)
    raise "Unknown collector! Calling to police..." if who != "Bank"
    @money = 0
    "Encashment complete!"
  end

end