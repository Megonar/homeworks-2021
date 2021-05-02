# frozen_string_literal: true

require 'time'
TIME = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/.freeze

def task_3(logs)
  lines = logs.split(/\n/)
  str = lines.select { |line| line.include?('Calling') }
  str.map { |line| line[TIME] }
  str.empty? ? 0 : method(str)
end

def method(str)
  arr = []
  str.each_cons(2) { |str_one, str_two| arr << Time.parse(str_two) - Time.parse(str_one) }
  arr.join(',')
end

puts task_3("2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
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
    2018-04-23 17:19:48.6 ubuntu-xenial[14319] Debug - Calling core with action: event")
