# frozen_string_literal: true

require 'rspec'
require_relative 'task_2'

right_logs =

  RSpec.describe 'Test task_2.rb' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      LOGS
    end

    let(:right_logs) do
      [
        'DATE: [23/Apr/2018:20:30:39 +0300] FROM: 10.6.246.103 TO: ["/test/2/messages"]',
        'DATE: [23/Apr/2018:20:30:42 +0300] FROM: 10.6.246.101 TO: ["/test/2/run"]',
        'DATE: [23/Apr/2018:20:31:39 +0300] FROM: 10.6.246.101 TO: ["/test/2/messages"]'
      ]
    end

    context 'when logs do not get the line' do
      it 'return empty array' do
        expect(task2('')).to eq([])
      end
    end

    context 'when logs get random text' do
      it 'return Error' do
        expect { task2 }.to raise_error(ArgumentError)
      end
    end

    context 'when logs have wrong format' do
      it 'wrong format should be ignored' do
        expect(task2(logs)).to eq(right_logs)
      end
    end
  end
