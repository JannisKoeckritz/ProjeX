class ExportService

	def initialize(elements)
	end

	def self.csv_export(todos)
		new(todos).todos_to_csv(todos)
	end

	def self.project_csv_export(projects)
		new(projects).projects_to_csv(projects)
	end

	def todos_to_csv(todos)
		CSV.generate(col_sep: ';') do |csv|
			csv << ["ID", "Projekt", "Aufgabe", "Beendet?", "Mindestkosten",
			 "Maximalkosten", "Aufwand", "Details", "Erstellt von", "Erstellt am", "Update am"]
			todos.each do |t|
				csv << [
					t.id,
					t.project.project_name,
					t.task,
					t.finished,
					t.min_cost,
					t.max_cost,
					t.level, 
					t.details,
					t.created_by,
					t.created_at,
					t.updated_at
				]
			end
		end
	end

	def projects_to_csv(projects)
		CSV.generate(col_sep: ';') do |csv|
			csv << ["ID", "Projektname","Zielstellung", "Beendet?", "Fertigstellung bis", 
				"Erstellt von", "Erstellt am", "Update am"]
				projects.each do |p|
					csv << [
						p.id,
						p.project_name,
						p.goal,
						p.end,
						"noch nicht gesetzt",
						p.created_by,
						p.created_at,
						p.updated_at
					]
				end
		end
	end

end