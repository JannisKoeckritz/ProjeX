class EditDeadlineFormat < ActiveRecord::Migration[5.1]
  def change
  	change_column :projects, :deadline, :datetime, :default => "", :null => false
  end
end
