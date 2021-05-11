# frozen_string_literal: true

def task_1(data)
  str = data.split("\n")
  str.map { |line| line.downcase.include?('error') ? line : '' }.join('')
  str.first
end
