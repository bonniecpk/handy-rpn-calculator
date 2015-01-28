module Handy
  class RPNStack < Array
    def calculate(operator)
      operand2 = self.pop
      operand1 = self.pop

      unless operand1.type == Component::OPERAND &&
             operand2.type == Component::OPERAND &&
             operator.type == Component::OPERATOR
        raise SyntaxError.new("#{operand1} #{operand2} #{operator} is invalid")
      end

      self << Component.new(eval("#{operand1.to_f} #{operator} #{operand2}"))

      self
    end

    def to_s
      self.join(" ")
    end
  end
end
