module ProjectHelper

	def get_cost(todos, value )
		cost = 0
		if value == "min"
			todos.each do |t| 
				cost = cost + t.min_cost
			end
		elsif value == "max"
			todos.each do |t|
				cost = cost + t.max_cost
			end
		end
		return cost.to_s + "€"
	end

	def user_todo(todo)
		if UserTodo.where(user_id: current_user.id, todo_id: todo.id). count == 1
			true
		else
			false
		end
	end

end