module TodoHelper
	def current_user_todo(param)
		if !param.users.where(id: current_user.id).blank?
			true
		else
			false
		end
	end

	def translate_status(status)
		if status == true
			"Beendet"
		else
			"Noch offen"
		end
	end
end