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
    # negative test case
    assert_not_equal(Prime.first(4).push(rand(4)*2), PrimeMultiplicationTable.new(5).send(:primes))
  end

  def test_less_than_1_primes
    expected_output = <<-EOF
Number should be greater than zero
EOF

    output, err = capture_output { PrimeMultiplicationTable.new(-1).execute }
    assert_equal(expected_output, output)
  end

  def test_greater_than_1_primes
    # Test case 1: n = 5
    expected_output = <<-EOF
|       |     2 |     3 |     5 |     7 |    11 |
|     2 |     4 |     6 |    10 |    14 |    22 |
|     3 |     6 |     9 |    15 |    21 |    33 |
|     5 |    10 |    15 |    25 |    35 |    55 |
|     7 |    14 |    21 |    35 |    49 |    77 |
|    11 |    22 |    33 |    55 |    77 |   121 |
EOF
    output, err = capture_output { PrimeMultiplicationTable.new(5).execute }
    assert_equal(expected_output, output)
  end
  
  def test_equal_to_1_primes
    expected_output = <<-EOF
|     |   2 |
|   2 |   4 |
EOF
    output, err = capture_output { PrimeMultiplicationTable.new(1).execute }
    assert_equal(expected_output, output)
  end

end
