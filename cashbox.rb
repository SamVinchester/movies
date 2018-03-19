module Cashbox

  def cash
  	puts @balance
  end
  COST = { (6..12) => 3, (12..18) => 5, (18..23) => 10}
  SCHEDULE = { (6..12) => { period: /ancient|classic/ }, (12..18) => { genre: /Comedy|Action/ }, (18..23) => { genre: /Drama|Horror/ }, (0..1) => { genre: "Western", period: "new" }}

  def buy_ticket(arg)
    m = arg.match(/^([0-2]\d):([0-5]\d)$/) or raise "Incorrect time!"
    hour = m[1].to_i
    raise "Incorrect time!" if hour > 23
    COST.detect {|time, cost| @balance += cost if time.cover?(hour)}
    _, search = SCHEDULE.detect {|time, filters|time.cover?(hour)}
    if search.nil?
      puts "At this time movie is not shown"
    else
      puts "You bought a movie ticket: " + self.filter(search).sample.tittle
    end
  end
end