require 'rails_helper'
require_relative '../../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'given an empty string' do
      it 'returns 0' do
        expect(StringCalculator.new.add('')).to eq(0)
      end
    end

    context 'given a single number' do
      it 'returns the number' do
        expect(StringCalculator.new.add('10')).to eq(10)
      end
    end

    context 'given a string that cannot be converted to an integer' do
      it 'raises an error' do
        expect { StringCalculator.new.add('abc') }.to raise_error(ArgumentError)
      end
    end
  end
end
