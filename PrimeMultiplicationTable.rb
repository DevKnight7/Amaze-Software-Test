class PrimeMultiplicationTable
  attr_accessor :number

  SPACE = ' '

  def initialize(number)
    @number = number
  end

  def execute
    return puts 'Number should be greater than zero' if number < 1

    do_multiplication
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

    def print_row(row, max_space)
      output = "|"
      row.each do |num|
        output += "#{SPACE * (max_space-num.to_s.length)} #{num} |"
      end

      puts output
    end

    def max_length(num)
      @max_length ||= ((num * num).to_s.length + 2)
    end

    def do_multiplication
      header = primes.map { |x| x.to_s }
      print_row([' ', header].flatten, max_length(primes.last))

      primes.each do |prime|
        row = primes.map { |x| (prime.to_i * x) }
        print_row([prime, row].flatten, max_length(primes.last))
      end
    end
end
