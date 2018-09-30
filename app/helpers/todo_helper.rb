module TodoHelper
	def current_user_todo(param)
		if !param.users.where(id: current_user.id).blank?
			true
		else
			false
		end
	end
end