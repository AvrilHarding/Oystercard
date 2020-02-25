class Oystercard

  LIMIT = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance
  # attr_accessor :in_journey

  def initialize
    @balance = 0
    # @in_use = false
    @in_journey = false
  end

  def top_up(amount)
    fail "Exceeds top up limit: #{LIMIT}" if amount + balance > LIMIT
    @balance += amount
    end

    def deduct(amount)
      @balance -= amount
    end

    def in_journey?
      # if in_use return true else return false (ternary operator)
      @in_journey
    end

    def touch_in
      fail "Not enough money" if balance < MINIMUM_BALANCE
    @in_journey = true
    end

    def touch_out
    @in_journey = false
    end
  end
