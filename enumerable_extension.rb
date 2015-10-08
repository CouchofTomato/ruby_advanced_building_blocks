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
			is_true = yield n
			if is_true
				return_array << n
			end
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
		count = self.length
		if num.first != nil
			count = 0
			num2 = num.first
			self.my_each do |n|
				if num2 == n
					count += 1
				end
			end
		end
		count
	end

end

test = [1,2,3,4,5,6,7,8,9,10]
puts test.my_count

