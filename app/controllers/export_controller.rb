class ExportController < ApplicationController
	def export
			@todos = current_user.todos
			export_data = ExportService.csv_export(@todos)
			send_data "\uFEFF" + export_data, filename: "Deine Todos - #{Date.today.strftime("%d.%m.%Y")}.csv"
	end
end