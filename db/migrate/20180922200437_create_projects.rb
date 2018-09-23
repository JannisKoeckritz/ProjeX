class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
    	t.string :project_name,	null: false, default: ""
    	t.boolean	:end,					null: false, default: false
    	t.string	:created_by,	null: false, default: ""
    	t.string :goal,					default: ""
      t.timestamps
    end
  end
end
