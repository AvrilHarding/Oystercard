class Oystercard

  LIMIT = 90
  attr_reader :balance
  attr_accessor :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Exceeds top up limit: #{LIMIT}" if amount + balance > LIMIT
    @balance += amount
    end

    def deduct(amount)
      @balance -= amount
    end

    def in_journey?
      # if in_use return true else return fale (ternary operator)
      return in_use ? true : false
    end
  end
