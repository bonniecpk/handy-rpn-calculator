require_relative 'init'

while true
  begin
    puts "Please enter a Reverse Polish Notation: (Type 'exit' to quit)"
    $input = gets

    break if $input.strip.downcase == 'exit'
    
    puts "Answer is #{Handy::RPNCalculator.new($input).calculate}"
  rescue Exception => e
    puts "ERROR: #{e.message}"
  end
end
