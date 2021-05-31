# frozen_string_literal: true

require 'time'
TIME = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/.freeze

def task_3(logs)
  lines = logs.split(/\n/)
  str = lines.select { |line| line.include?('Calling') }
  str.map { |line| line[TIME] }
  decision(str)
end

private

def decision(str)
  subtraction = []
  subtraction << if str.empty?
                   '0'
                 else
                   str.each_cons(2).map do |str_one, str_two|
                     Time.parse(str_two) - Time.parse(str_one)
                   end.join(',')
                 end
end
