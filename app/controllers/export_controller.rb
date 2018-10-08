class ExportController < ApplicationController

	def export
			@todos = current_user.todos
			export_data = ExportService.csv_export(@todos)
			send_data "\uFEFF" + export_data, filename: "Deine Todos - #{Date.today.strftime("%d.%m.%Y")}.csv"
	end

	def project_export
		@projects = current_user.projects
		export_data = ExportService.project_csv_export(@projects)
		send_data "\uFEFF" + export_data, filename: "Deine Projekte - #{Date.today.strftime("%d.%m.%Y")}.csv"
	end

	def single_project_export
		@project = Project.find(params[:project_id])
		@project_todos = @project.todos
		export_data = ExportService.csv_export(@project_todos)
		send_data "\uFEFF" + export_data, filename: "#{@project.project_name}-Todos - #{Date.today.strftime("%d.%m.%Y")}.csv"
	end
	
end