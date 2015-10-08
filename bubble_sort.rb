def bubble_sort(array)
	n = array.length
	loop do
	    swapped = false

	    (n-1).times do |i|
	      if array[i] > array[i+1]
	        array[i], array[i+1] = array[i+1], array[i]
	        swapped = true
	      end
	    end

	    break if not swapped
  end
  array
end

puts bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
	n = array.length
	loop do
		swapped = false
		(n - 1).times do |i|
			num = yield array[i], array[i+1]
			if num > 0
				array[i], array[i+1] = array[i+1], array[i]
				swapped = true
			end
		end
		break if not swapped
	end
	array	
end

test = bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end

test2 = bubble_sort_by([4,3,78,2,0,2]) do |left,right|
	left - right
end

puts test
puts test2