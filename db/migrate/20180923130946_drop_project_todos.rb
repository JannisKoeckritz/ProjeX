class DropProjectTodos < ActiveRecord::Migration[5.1]
  def change
    drop_table :project_todos
  end
end
