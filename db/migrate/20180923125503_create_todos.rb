class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
    	t.string :task
    	t.boolean :finished
    	t.decimal :min_cost, :precision => 15, :scale => 5
    	t.decimal :max_cost, :precision => 15, :scale => 5
    	t.integer :level
    	t.string :created_by
      t.timestamps
    end
  end
end
