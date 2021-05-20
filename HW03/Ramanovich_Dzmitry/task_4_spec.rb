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
end
