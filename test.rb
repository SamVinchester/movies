require 'money'

# 10.00 USD
money = Money.new(1000, "USD")
p money.cents     #=> 1000
p money.currency  #=> Currency.new("USD")

# Comparisons
p Money.new(1000, "USD") == Money.new(1000, "USD")   #=> true
p Money.new(1000, "USD") == Money.new(100, "USD")    #=> false
p Money.new(1000, "USD") == Money.new(1000, "EUR")   #=> false
p Money.new(1000, "USD") != Money.new(1000, "EUR")   #=> true

# Arithmetic
p Money.new(1000, "USD") + Money.new(500, "USD") == Money.new(1500, "USD")
p Money.new(1000, "USD") - Money.new(200, "USD") == Money.new(800, "USD")
p Money.new(1000, "USD") / 5                     == Money.new(200, "USD")
p Money.new(1000, "USD") * 5                     == Money.new(5000, "USD")

# Unit to subunit conversions
p Money.from_amount(5, "USD") == Money.new(500, "USD")  # 5 USD
p Money.from_amount(5, "JPY") == Money.new(5, "JPY")    # 5 JPY
p Money.from_amount(5, "TND") == Money.new(5000, "TND") # 5 TND

# Currency conversions
#some_code_to_setup_exchange_rates
#Money.new(1000, "USD").exchange_to("EUR") == Money.new(some_value, "EUR")

# Formatting (see Formatting section for more options)
#Money.new(100, "USD").format #=> "$1.00"
#Money.new(100, "GBP").format #=> "£1.00"
#Money.new(100, "EUR").format #=> "€1.00"