require 'money'
module Cashbox

  def cash(cinema)
  	puts (@netflix_money).cents if cinema == "Netflix"
    puts (@theatre_money).cents if cinema == "Theatre"
  end
  COST = { (6..12) => Money.new(300, "USD"), (12..18) => Money.new(500, "USD"), (18..23) => Money.new(1000, "USD")}

  def buy_ticket (movie, time)
    puts "You bought ticket on " + @mov_arr.map { |film| film.tittle if film.tittle == movie}.compact.join
    sale = COST.detect {|period, cost| period.cover?(time.to_i)}[1]
    @theatre_money = @theatre_money + sale
  end

  def take (who)
    begin
    if who == "Bank"
      puts "Encashment complete!"
      @theatre_money = 0
      @netflix_money = 0
    else
      raise "error"
    end
    rescue RuntimeError
      puts "Unknown collector! Calling to police..."
    end
  end

end