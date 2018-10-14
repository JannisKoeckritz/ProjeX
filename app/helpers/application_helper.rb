module ApplicationHelper
	def get_percent(project)
		if (project.todos.where(finished: true).count.to_f / project.todos.count.to_f > 0)
			(project.todos.where(finished: true).count.to_f / project.todos.count.to_f * 100).round(2)
		end
	end

	def translate_bool(bool)
		if bool == true
			"Ja"
		else
			"Nein"
		end
	end

	def project_user?(user, project)
		if UserProject.where(user_id: user.id, project_id: project.id)
			true
		else
			false
		end
	end

end
