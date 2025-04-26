# spec/lib/string_calculator_spec.rb
require 'string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    it 'returns 0 for empty string' do
      expect(calculator.add("")).to eq(0)
    end

    it 'returns number for single number string' do
      expect(calculator.add("1")).to eq(1)
    end

    it 'returns sum for two numbers separated by comma' do
      expect(calculator.add("1,5")).to eq(6)
    end

    it 'returns sum for multiple numbers separated by comma' do
      expect(calculator.add("1,2,3,4")).to eq(10)
    end

    it 'handles new lines between numbers' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises error for negative numbers' do
      expect { calculator.add("1,-2,3,-4") }.to raise_error(ArgumentError, "negative numbers not allowed -2,-4")
    end
  end
end
