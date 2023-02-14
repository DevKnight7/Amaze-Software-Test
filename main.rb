require "./PrimeMultiplicationTable.rb"

if __FILE__ == $PROGRAM_NAME
  puts("Please Enter value of N: ")
  while n = Integer(gets.chomp) rescue 'NotInteger'
    if n=='NotInteger'
      puts "Invalid Input(Enter An Integer Number should be a greater than zero)"
    else
      PrimeMultiplicationTable.new(n).execute
    end
    puts("Please Enter value of N or ^C to exit: ")
  end
end
