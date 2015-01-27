module Handy
  class SyntaxError < StandardError; end

  class RPNCalculator
    # Assume the expression is delimited by spaces
    def initialize(expression)
      @inputs = expression.split.collect { |comp| ComponentFactory.categorize(comp) }
    end

    def calculate
      stack = RPNStack.new
      @inputs.each do |component|
        if stack.size < 2
          raise SyntaxError.new("Not enough operands before operator:#{component}, stack:#{stack}") if component == Component::OPERATOR
          stack << component
        else
          stack.eval(operator) if component == Component::OPERATOR
          #stack.pop_parenthesis if component.class == CloseParenthesis
        end
      end
    end
  end
end
