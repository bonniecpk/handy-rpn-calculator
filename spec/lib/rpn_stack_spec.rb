require_relative '../spec_helper'

module Handy
  describe RPNStack do
    context "#calcuate" do
      def stack(op1, op2)
        stack = RPNStack.new
        stack << Component.new(op1)
        stack << Component.new(op2)
        stack
      end

      it '3 + 2' do
        stack = stack('3', '2')
        expect(stack.calculate(Component.new('+')).pop.to_i).to eq(5)
      end

      it '+ + 2' do
        stack = stack('+', '2')
        expect{ stack.calculate(Component.new('+')) }.to raise_error(SyntaxError)
      end

      it '3 3 2' do
        stack = stack('3', '2')
        expect{ stack.calculate(Component.new('3')) }.to raise_error(SyntaxError)
      end
    end
  end
end


