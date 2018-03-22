require 'money'
module Cashbox
  
  def cash
    @money
  end

  def pay(cents)
    if cents.is_a?(Integer)
      @money += cents
      @balance += cents
    else
      raise "Incorrect pay"
    end
  end

  def take (who)
    if who == "Bank"
      @money = 0
      "Encashment complete!"
    else
      raise "Unknown collector! Calling to police..."
    end
  end

end


  #def cash
  #  puts @theatre_money.cents
  #end

  #def cash(cinema)
  # puts (@netflix_money).cents if cinema == "Netflix"
  #  puts (@theatre_money).cents if cinema == "Theatre"
  #end
  #COST = { (6..12) => Money.new(300, "USD"), (12..18) => Money.new(500, "USD"), (18..23) => Money.new(1000, "USD")}

  #def buy_ticket (movie, time)
  #  puts "You bought ticket on " + @mov_arr.map { |film| film.tittle if film.tittle == movie}.compact.join
  #  sale = COST.detect {|period, cost| period.cover?(time.to_i)}[1]
  #  @theatre_money = @theatre_money + sale
  #end

  #def take (who)
  #  begin
  #  if who == "Bank"
  #    puts "Encashment complete!"
  #    @theatre_money = 0
  #    @netflix_money = 0
  #  else
  #    raise "error"
  #  end
  #  rescue RuntimeError
  #    puts "Unknown collector! Calling to police..."
  #  end
  #end