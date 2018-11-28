class RemoveUserIdFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :userId, :integer
  end
end
