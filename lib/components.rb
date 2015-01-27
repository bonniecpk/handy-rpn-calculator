module Handy
  class Component
    OPERAND  = 0
    OPERATOR = 1

    attr_reader :type

    def initialize(op)
      @value = op.to_s
      @type  = if op.is_a? Integer
                 Component::OPERAND
               elsif /^[0-9]+$/ =~ op
                 Component::OPERAND
               elsif /^[+\-*\/]$/ =~ op
                 Component::OPERATOR
               else
                 raise InvalidComponent.new("#{op} is invalid")
               end
    end

    def to_s
      @value
    end

    def to_i
      @value.to_i
    end
  end
end
