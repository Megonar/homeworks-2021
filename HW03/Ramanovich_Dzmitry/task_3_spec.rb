# frozen_string_literal: true

require 'rspec'
require_relative 'task_3'

RSpec.describe 'Test task_3.rb' do
  let(:log) do
    <<~LOGS
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
    LOGS
  end

  let(:log_much_events) do
    <<~LOGS
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:19:22.4 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:19:25.9 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:19:48.6 ubuntu-xenial[14319] Debug - Calling core with action: event
    LOGS
  end

  context 'when in log two right event' do
    it 'return duration of the action in SECONDS between events that occurred' do
      expect(task_3(log)).to eq(['49.1'])
    end
  end

  context 'when zero events' do
    it 'return 0' do
      expect(task_3('')).to eq('0')
    end
  end

  context 'when much events' do
    it 'return quantity seconds' do
      expect(task_3(log_much_events)).to eq(['49.1,21.0,22.6,26.2'])
    end
  end
end
