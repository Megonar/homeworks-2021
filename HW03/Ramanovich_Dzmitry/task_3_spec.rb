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

  context 'when in log two right format' do
    it 'return duration of the action in SECONDS between events that occurred' do
      expect(task_3(log)).to eq('49.1')
    end
  end
end
