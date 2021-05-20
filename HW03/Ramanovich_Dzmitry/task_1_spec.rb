# frozen_string_literal: true

require 'rspec'
require_relative 'task_1'

logs = <<~LOG
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
LOG

log = <<~LOG
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
LOG

logs_with_errors = <<~LOG
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
  2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
  2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
LOG

random_text = 'aaaabbbccc12345'

string_with_errors = '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'

RSpec.describe 'Test task_1.rb' do
  context 'when logs have errors' do
    it 'return full text first line with an error' do
      expect(task_1(logs)).to eq(string_with_errors)
    end
  end

  context 'when logs have no line with errors' do
    it 'return empty line' do
      expect(task_1(log)).to eq('')
    end
  end

  context 'when logs have many errors' do
    it 'return first line with errors' do
      expect(task_1(logs_with_errors)).to eq(string_with_errors)
    end
  end

  context 'when no arguments is given' do
    it 'return Error' do
      expect { task_1 }.to raise_error(ArgumentError)
    end
  end
  context 'when logs do not get the text' do
    it 'return empty line' do
      expect(task_1('')).to eq('')
    end
  end
  context 'when logs get random text' do
    it 'return Error' do
      expect { task_1 }.to raise_error(ArgumentError)
    end
  end
end
