# frozen_string_literal: true

require 'time'

TIME = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/.freeze

def task_3(logs)
  subtraction = []
  lines = logs.split(/\n/)
  str = lines.select { |line| line.include?('Calling') }
  str.map { |line| line[TIME] }
  if str.empty?
    '0'
  else
    subtraction << str.each_cons(2).map do |str_one, str_two|
      Time.parse(str_two) - Time.parse(str_one)
    end.join(',')
  end
end
