module Handy
  class RPNStack < Array
    def eval(operator)
      operand2 = stack.pop
      operand1 = stack.pop

      unless operand1.class == Operand && operand2.class == Operand
        raise SyntaxError.new("#{operand1} #{operand2} #{operator} is invalid")
      end

      self << eval "#{operand1} #{operator} #{operand2}"
    end

    #def pop_parenthesis
    #  operand = stack.pop
    #  open_p = stack.pop
    #  if open_p == Component::OPEN_PARENTHESIS
    #    raise SyntaxError.new("Should be open parenthesis, but #{open_p}. stack: #{stack}, operand: #{operand}")
    #  end
    #  self << operand
    #end

    def to_s
      self.join(" ")
    end
  end
end
