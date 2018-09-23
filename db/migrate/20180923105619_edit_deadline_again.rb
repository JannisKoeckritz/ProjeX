class EditDeadlineAgain < ActiveRecord::Migration[5.1]
  def change
  	change_column :projects, :deadline, :datetime, :null => false
  end
end
