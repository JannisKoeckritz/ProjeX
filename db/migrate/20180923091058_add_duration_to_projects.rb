class AddDurationToProjects < ActiveRecord::Migration[5.1]
  def change
  	add_column :projects, :deadline, :datetime, default: (DateTime.now + 1.week)
  end
end
