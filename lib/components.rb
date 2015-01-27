module Handy
  class Component
    OPERAND  = 0
    OPERATOR = 1

    attr_reader :type

    def initialize(op, type)
      @value = op
      @type  = type
    end

    def to_s
      @value
    end

    def to_i
      @value.to_i
    end
  end

  class ComponentFactory
    class << self
      def categorize(comp)
        type = if /^[0-9]+$/ =~ comp
                 Component::OPERAND
               elsif /^[+\-*\/]$/ =~ comp
                 Component::OPERATOR
               else
                 raise InvalidOperand.new("#{comp} is invalid")
               end
        Component.new(comp, type)
      end
    end
  end
end
