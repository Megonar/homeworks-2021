# frozen_string_literal: true

require 'rspec'
require_relative 'task_4'

RSpec.describe 'Test task_4' do
  context 'when input only digits' do
    it 'output only quantity digits' do
      expect(quantity('12345')).to eq({ digits: 5, letters: 0 })
    end
  end
  context 'when input only letters' do
    it 'output only quantity letters' do
      expect(quantity('qwerty')).to eq({ digits: 0, letters: 6 })
    end
  end
  context 'when input only symbol' do
    it 'output 0 letters and 0 digits' do
      expect(quantity('/////,.,.,')).to eq({ digits: 0, letters: 0 })
    end
  end
  context 'when no arguments in input' do
    it 'return Error' do
      expect { quantity }.to raise_error(ArgumentError)
    end
  end
  context 'when in input symbol, letters and digits' do
    it 'return quantity only letters and digits' do
      expect(quantity('123zxc///')).to eq({ digits: 3, letters: 3 })
    end
  end
end
