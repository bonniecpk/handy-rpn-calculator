require_relative '../spec_helper'

module Handy
  describe Component do
    context "#initialize" do
      it 'integer' do
        comp = Component.new(3)
        expect(comp.to_s).to eq('3')
        expect(comp.type).to eq(Component::OPERAND)
      end

      it 'float' do
        comp = Component.new(3.3)
        expect(comp.to_s).to eq('3.3')
        expect(comp.type).to eq(Component::OPERAND)
      end

      it 'operand' do
        comp = Component.new('3')
        expect(comp.to_s).to eq('3')
        expect(comp.type).to eq(Component::OPERAND)
      end

      it 'operator' do
        comp = Component.new('+')
        expect(comp.to_s).to eq('+')
        expect(comp.type).to eq(Component::OPERATOR)
      end

      it 'invalid component' do
        expect { Component.new('dasf') }.to raise_error(InvalidComponent)
      end
    end
  end
end



