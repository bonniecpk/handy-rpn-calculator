module Handy
  class SyntaxError < StandardError; end

  class RPNCalculator
    # Assume the expression is delimited by spaces
    def initialize(expression)
      @inputs = expression.split.collect { |comp| Component.new(comp) }
    end

    def calculate
      stack = RPNStack.new
      
      @inputs.each do |component|
        if stack.size < 2
          raise SyntaxError.new("Not enough operands before operator:#{component}, stack:#{stack}") if component.type == Component::OPERATOR
          stack << component
        else
          if component.type == Component::OPERATOR
            stack.calculate(component)
          else
            stack << component
          end
        end
      end

      raise SyntaxError.new("There're remaining components in the stack: #{stack}") if stack.size > 1

      stack.pop.to_i
    end
  end
end
