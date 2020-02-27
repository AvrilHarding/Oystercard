class Oystercard

  LIMIT = 90
  MINIMUM_BALANCE = 1
  TRAVEL_COST = 4
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journey
  attr_reader :journey_history
  # attr_accessor :in_journey

  def initialize
    @balance = 0
    # @in_use = false
    @in_journey = false
    @journey_history = []
    #@entry_station = "Farringdon"
  end

  def top_up(amount)
    fail "Exceeds top up limit: #{LIMIT}" if amount + balance > LIMIT
    @balance += amount
    end

    # def deduct(amount)
    #   @balance -= amount
    # end

    def in_journey?
      # if in_use return true else return false (ternary operator)
      # @in_journey - this was replaced by the double_bang operator to infer that it is false then true then false
      !!entry_station
    end

    def touch_in(entry_station)
      fail "Not enough money" if balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = entry_station
    end

    def touch_out(exit_station)
      puts "You have £#{deduct} left on your card"
      # @balance -= 4
    @in_journey = false
    # @entry_station = nil
    @exit_station = exit_station
    @journey = {@entry_station => @exit_station}
    @journey_history.push(@journey)
    end



    # def station
    #   @station
    # end

private
    def deduct
      @balance -= TRAVEL_COST
    end
  end
