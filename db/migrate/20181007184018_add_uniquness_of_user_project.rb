class AddUniqunessOfUserProject < ActiveRecord::Migration[5.1]
  def change
  	add_index :user_projects, [:user_id, :project_id], unique: true
  end
end
