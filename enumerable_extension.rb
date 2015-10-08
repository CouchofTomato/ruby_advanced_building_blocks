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
end

test = ["ant", "bear", "cat"]
puts test.none? {|n| n.length >= 4}



