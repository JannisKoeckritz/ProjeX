class AddProjectId < ActiveRecord::Migration[5.1]
  def change
  	add_reference :todos, :project, index: true
  end
end
