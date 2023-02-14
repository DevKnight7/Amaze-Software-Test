class PrimeMultiplicationTable
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  private
    def prime?(n)
      return false if n <= 1

      (2..Math.sqrt(n).to_i).each do |i|
        return false if n % i == 0
      end

      true
    end

    def primes
      primes_arr = []
      flag = 2
      while primes_arr.length < number
        primes_arr << flag if prime?(flag.to_i)
        flag += 1
      end

      primes_arr
    end
end
