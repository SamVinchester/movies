require 'money'
module Cashbox
  attr_accessor(:money)

  def cash
    @cash ||= Money.new(0, 'USD').cents
  end

  def pay(cents)
    @cash = cash
    raise 'Incorrect pay' unless cents.is_a?(Integer)
    @cash += cents
  end

  def take(who)
    raise 'Unknown collector! Calling to police...' if who != 'Bank'
    @cash = 0
    'Encashment complete!'
  end
end
