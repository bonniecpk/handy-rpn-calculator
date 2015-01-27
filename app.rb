require_relative 'init'

while true
  puts "Please enter a Reverse Polish Notation: "
  $input = gets
  puts Handy::RPNCalculator.new($input).calculate
end
