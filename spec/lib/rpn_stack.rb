require_relative '../spec_helper'

module Handy
  describe RPNStack do
    context "#calcuate" do
      def stack(op1, op2)
        stack = RPNStack.new
        stack << ComponentFactory.categorize(op1)
        stack << ComponentFactory.categorize(op2)
        stack
      end

      it '3 + 2' do
        stack = stack('3', '2')
        expect(stack.calculate(ComponentFactory.categorize('+')).pop).to eq(5)
      end

      it '+ + 2' do
        stack = stack('+', '2')
        expect{ stack.calculate(ComponentFactory.categorize('+')) }.to raise_error(SyntaxError)
      end

      it '3 3 2' do
        stack = stack('3', '2')
        expect{ stack.calculate(ComponentFactory.categorize('3')) }.to raise_error(SyntaxError)
      end
    end
  end
end


