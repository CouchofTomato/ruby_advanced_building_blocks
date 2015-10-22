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

	#my_map method 2 taking a Proc instead of a Block
	def my_map2(input)
		return_array = []
		self.my_each do |obj|
			val = input.call(obj)
			return_array << val
		end
		return_array
	end

	#my_map method 3 taking a Proc or a Block
	def my_map3(input = nil)
		if input && block_given?
			return_array = []
			self.my_each do |obj|
				val = input.call(yield obj)
				return_array << val
			end
		elsif input
			return_array = []
			self.my_each do |obj|
				val = input.call(obj)
				return_array << val
			end
		else
			return self
		end
		return_array
	end

	def my_inject(input = nil)
		if input == nil
			sum = self[0]
			new_array = self.clone
			new_array.shift
			new_array.my_each do |obj|
				sum = yield sum, obj
			end
		else
			sum = input
			self.my_each do |obj|
				sum = yield sum, obj
			end
		end
		sum
	end

end

def multiply_els(input)
	input.my_inject { |sum, obj| sum * obj}
end