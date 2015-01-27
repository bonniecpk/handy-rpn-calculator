module Handy
  class Component
    OPERAND  = 0
    OPERATOR = 1
    OPEN_PARENTHESIS  = 2
    CLOSE_PARENTHESIS = 3

    def initialize(op, type)
      @value = op
      @type  = type
    end

    def to_s
      @value
    end
  end

  class ComponentFactory
    class << self
      def categorize(comp)
        type = if /^[0-9]+$/ ~= comp
                 OPERAND
               elsif /^[+-*/]$/ ~= comp
                 OPERATOR
               else
                 raise InvalidOperand.new("#{comp} is invalid")
               end
        Component.new(comp, type)
      end
    end
  end
end
