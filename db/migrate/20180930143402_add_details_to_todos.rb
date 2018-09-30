class AddDetailsToTodos < ActiveRecord::Migration[5.1]
  def change
  	add_column :todos, :details, :string
  end
end
