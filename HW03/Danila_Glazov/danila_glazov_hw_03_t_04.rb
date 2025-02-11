# frozen_string_literal: false

NOT_DIGITS = /[^\d]/.freeze
NOT_LETTERS = /[^a-zA-Z]/.freeze

def string_info(str)
  digits = str.gsub(NOT_DIGITS, '')
  letters = str.gsub(NOT_LETTERS, '')
  { letters: letters.length, digits: digits.length }
end

def letter_counter(str)
  letters = {}

  (0...str.length).each { |i| letters[str[i]].nil? ? letters[str[i]] = 1 : letters[str[i]] += 1 }

  letters
end
