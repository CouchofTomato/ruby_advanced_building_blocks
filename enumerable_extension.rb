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
		return_array = []
		self.my_each do |n|
			result << n if yield n
		end
		return_array
	end

	def my_all?
		self.my_each do |n|
			is_true = yield n
			if is_true == false
				return false
			end
		end
		true
	end

	def my_any?
		self.my_each do |n|
			is_true = yield n
			if is_true
				return true
			end
		end
		false
	end

	def my_none?
		self.my_each do |n|
			is_true = yield n
			if !is_true
				return true
			end
		end
		false
	end

	def my_count(*num)
		count = 0
		unless block_given?			
			if args.empty?
				self.my_each { |item| count += 1 }
			else			
				self.my_each { |item| count += 1 if item == args[0] }
			end
		else
			self.my_each { |item| count += 1 if yield item }
		end
		count
	end

	def my_map
		return_array = []
		return self unless block_given?
		self.my_each do |n|
			temp = yield n
			return_array << temp
		end
		return_array
	end

	def my_inject(num = nil)
		sum = num || self.first
		unless block_given?
			sum = self.to_a
		else
			self.to_a.my_each { |n|	sum = yield(sum, n) }
		end
		sum
	end

end

test = [1,2,3]
puts test.my_inject {|sum, val| sum - val}
puts test.inject {|sum, val| sum - val}


