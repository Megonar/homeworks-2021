# frozen_string_literal: true

require_relative 'my_array_method'

using MyArrayMethod

RSpec.describe MyArrayMethod do
  let(:array_empty) { [] }
  let(:array) { [1, 2, 3, 4, 5] }

  describe '.my_map' do
    context 'when array is empty' do
      it 'array is empty' do
        expect(array_empty.my_map(&:even?)).to be_empty
      end
    end
    context 'when array is not empty' do
      it 'returns the same number of elements as the original array' do
        expect(array.my_map(&:even?).count).to eq(array.count)
      end
      it 'origin array does not change' do
        expect(array.my_each { |x| x * 2 }).to eq([1, 2, 3, 4, 5])
      end
    end
    context 'when array digits multiplication' do
      it 'returns new array with multiplication' do
        expect(array.my_map { |x| x * 2 }).to eq([2, 4, 6, 8, 10])
      end
    end
  end
end
