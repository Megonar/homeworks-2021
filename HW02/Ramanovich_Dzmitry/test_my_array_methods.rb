require_relative 'MyArrayMethod.rb'

using MyMethod

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts a.my_each { |x| puts x }
puts a.my_select { |x| puts x*2 }
puts a.my_map { |x| puts x*2 }