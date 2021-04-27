# frozen_string_literal: true

def quantity(str)
  str.strip.downcase
  hash = Hash.new

  hash[:letters] = str.count('a-z')
  hash[:digits] = str.count('0-9')

  puts hash
end
