module Handy
  class SyntaxError < StandardError; end

  class RPNCalculator
    # Assume the expression is delimited by spaces
    def initialize(expression)
      @inputs = expression.split.collect { |comp| Component.new(comp) }
    rescue InvalidComponent => e
      raise SyntaxError.new(e.message)
    end

    def calculate
      stack = RPNStack.new
      
      @inputs.each do |component|
        if stack.size < 2
          if component.type == Component::OPERATOR
            raise SyntaxError.new("Not enough operands before operator: #{component} [stack: #{stack}]")
          end
          stack << component
        else
          if component.type == Component::OPERATOR
            stack.calculate(component)
          else
            stack << component
          end
        end
      end

      raise SyntaxError.new("Operator is needed to calculate [stack: #{stack}]") if stack.size > 1

      stack.pop.to_f
    rescue InvalidComponent => e
      raise SyntaxError.new(e.message)
    end
  end
end
