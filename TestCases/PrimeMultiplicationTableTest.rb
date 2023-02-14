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
|\t  |\t2 |\t3 |\t5 |\t7 |\t11 |
|\t2 |\t4 |\t6 |\t10 |\t14 |\t22 |
|\t3 |\t6 |\t9 |\t15 |\t21 |\t33 |
|\t5 |\t10 |\t15 |\t25 |\t35 |\t55 |
|\t7 |\t14 |\t21 |\t35 |\t49 |\t77 |
|\t11 |\t22 |\t33 |\t55 |\t77 |\t121 |
EOF
    output, err = capture_output { PrimeMultiplicationTable.new(5).execute }
    puts output
    assert_equal(expected_output, output)

    # Test case 2: n = 1
    expected_output = <<-EOF
|\t  |\t2 |
|\t2 |\t4 |
EOF
    output, err = capture_output { PrimeMultiplicationTable.new(1).execute }
    assert_equal(expected_output, output)
  end

end
