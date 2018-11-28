class AddTaskStatusToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :taskStatus, :string
  end
end
