module ProjectHelper

	def get_cost(todos)
		min = 0
		max = 0
		todos.each do |t| 
			min = min + t.min_cost
			max = max + t.max_cost
		end
		return "Mindestkosten: #{min}€, Maximalkosten: #{max}€"
	end

end