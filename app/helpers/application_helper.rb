module ApplicationHelper
	def get_percent(project)
		if (project.todos.where(finished: true).count.to_f / project.todos.count.to_f > 0)
			(project.todos.where(finished: true).count.to_f / project.todos.count.to_f * 100)
		end
	end

	def translate_bool(bool)
		if bool == true
			"Ja"
		elsif bool == false
			"Nein"
		else
			"Fehler. Bitte wenden Sie sich an den Administrator."
		end
	end	

end
