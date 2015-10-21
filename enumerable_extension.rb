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

	def my_all?
		if !block_given?
			self.my_each { |obj| return false unless obj}
			return true
		end
		self.my_each { |obj| return false unless yield obj}
		return true
	end

	def my_any?
		if !block_given?
			self.my_each { |obj| return true if obj }
			return false
		end
		self.my_each { |obj| return true if yield obj}
		return false
	end

	def my_none?
		if !block_given?
			self.my_each{ |obj| return false if obj}
			return true
		end
		self.my_each { |obj| return false unless yield obj}
		return true
	end

	def my_count(input = nil)
		count = 0
		if block_given?
			self.my_each { |obj| count += 1 if yield obj }
		elsif input == nil
			self.my_each { |obj| count += 1 }
		else
			self.my_each { |obj| count += 1 if obj == input}
		end
		count
	end

	def my_map
		return enum_for(:each) unless block_given?
		return_array = []
		self.my_each do |obj|
			val = yield obj
			return_array << val
		end
		return_array
	end

	def my_inject(input = nil)
		if input == nil
			sum = self[0]
			self.my_each do |obj|
				next if obj.eql?(self[0])
				sum = yield sum, obj
			end
		end
		sum
	end

end

my_array = [1,2,3,4,5,6,7,8,9,10,1,1]
my_array2 = [false, nil, false]

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
puts
puts "my_all?"
print my_array.my_all? { |obj| obj.is_a? Integer}
puts
print my_array.my_all? { |obj| obj % 2 == 0}
puts
puts
puts "my_any?"
print my_array.my_any?
puts
print my_array2.my_any?
puts
puts my_array.my_any? { |obj| obj % 2 == 0}
puts my_array.my_any? { |obj| obj == 11 }
puts
puts "my_none?"
print my_array.my_none?
puts
print my_array2.my_none?
puts
print my_array.my_none? { |obj| obj % 2 == 0}
puts
print my_array.my_none? { |obj| obj.is_a? Integer}
puts
print my_array2.my_none?
puts
puts
puts "my_count"
print my_array.my_count
puts
print my_array.my_count(2)
puts
print my_array.my_count { |obj| obj % 2 == 0 }
puts
puts
puts "my_map"
print my_array.my_map { |obj| obj * 2 }
puts
puts
puts "my_inject"
print my_array.my_inject { |sum, obj| sum + obj }
puts
print my_array.inject { |sum, obj| sum + obj }