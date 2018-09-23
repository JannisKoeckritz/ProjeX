class EditDeadlineColumn < ActiveRecord::Migration[5.1]
  def change
  	change_column :projects, :deadline, :datetime, :default => DateTime.now + 1.week, :null => false
  end
end
