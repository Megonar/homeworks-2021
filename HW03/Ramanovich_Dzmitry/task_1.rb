# frozen_string_literal: true

def task_1(data)
  str = data.split("\n")
  str.map { |s| s.downcase.include?('error') ? s : '' }.join('')
end
