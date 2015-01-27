require_relative '../spec_helper'

module Handy
  describe RPNCalculator do
    context "#calcuate" do
      context "Good RPN syntax" do
        pairs = {
          "3 2 +"          => 5,
          "2 3 + 5 + 10 -" => 0,
          "2 2 2 * * 3 +"  => 11,
          '3 34 + 5 5 / -' => 36
        }

        pairs.each do |input, output|
          it input do
            expect(RPNCalculator.new(input).calculate).to eq(output)
          end
        end
      end

      context "Bad RPN syntax" do
        bad_syntaxes = [
          '2 2',
          '2 3 4',
          '2 * 3',
          '4 3 * 3',
          '3 34 + 5 5 /'
        ]

        bad_syntaxes.each do |bad_syntax|
          it bad_syntax do
            expect { RPNCalculator.new(bad_syntax).calculate }.to raise_error(SyntaxError)
          end
        end
      end
    end
  end
end

