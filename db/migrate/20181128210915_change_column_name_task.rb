class ChangeColumnNameTask < ActiveRecord::Migration[5.2]
  def change
  		rename_column :tasks, :taskDate, :task_date
  		rename_column :tasks, :taskStatus, :task_status
  end
end
