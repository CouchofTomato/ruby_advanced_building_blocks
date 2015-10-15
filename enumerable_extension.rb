module Enumerable
	def my_each
		i = 0
		while i < self.size
			yield self[i]
			i += 1
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield self[i], i
			i += 1
		end
		self
	end

	def my_select
		return enum_for(:each) unless block_given?
		return_array = []
		self.my_each do |input|
			return_array << input if yield input 
		end
		return_array
	end

end

my_array = [1,2,3,4,5,6,7,8,9,10]

puts "my_each"
my_array.my_each { |num| print "#{num} "}
puts
puts
puts "my_each_with_index"
my_array.my_each_with_index { |num, idx| print "#{idx}: #{num} -- "}
puts
puts
puts "my_select"
print my_array.my_select { |num| num % 2 == 0}
puts
p my_array.my_select
puts