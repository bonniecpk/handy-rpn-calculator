require_relative '../spec_helper'

module Handy
  describe RPNCalculator do
    context "#calcuate" do
      pairs = {
        "3 2 +"          => 5,
        "2 3 + 5 + 10 -" => 0,
        "2 2 2 * * 3 +"  => 11
      }

      pairs.each do |input, output|
        it input do
          expect(RPNCalculator.new(input).calculate).to eq(output)
        end
      end
    end
  end
end

