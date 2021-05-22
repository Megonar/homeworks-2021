# frozen_string_literal: true

module MyArrayMethod
  refine Array do
    def my_map
      my_arr = []
      (0...size).each do |i|
        my_arr << yield(self[i])
      end
      my_arr
    end

    def my_each
      (0...size).each do |i|
        yield(self[i])
      end
      self
    end

    def my_select
      arr = []
      (0...size).each do |i|
        arr << self[i] if yield(self[i])
      end
      arr
    end
  end
end
