require 'test/unit'
require "./PrimeMultiplicationTable"
require "prime"

class PrimeMultiplicationTableTest < Test::Unit::TestCase
  def test_is_prime?
    assert_equal(2.prime?, PrimeMultiplicationTable.new(2).send(:prime?, 2))
    assert_equal(3.prime?, PrimeMultiplicationTable.new(3).send(:prime?, 3))
    assert_equal(5.prime?, PrimeMultiplicationTable.new(5).send(:prime?, 5))
  end

  def test_is_not_prime?
    assert_equal(1.prime?, PrimeMultiplicationTable.new(1).send(:prime?, 1))
    assert_equal(4.prime?, PrimeMultiplicationTable.new(4).send(:prime?, 4))
    assert_equal(6.prime?, PrimeMultiplicationTable.new(6).send(:prime?, 6))
  end

  def test_primes
    # positive test case
    assert_equal(Prime.first(5), PrimeMultiplicationTable.new(5).send(:primes))
  end

  def test_primes_contain_non_prime_number
    #negative test case
    assert_not_equal(Prime.first(4).push(rand(4)*2), PrimeMultiplicationTable.new(5).send(:primes))
  end

end
