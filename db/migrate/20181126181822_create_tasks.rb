class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :taskName
      t.string :taskDate
      t.string :taskPriority
      t.integer :userId

      t.timestamps
    end
  end
end
