class CreateTaskStatuses < ActiveRecord::Migration
  def change
    create_table :task_statuses do |t|
      t.integer :task_id
      t.integer :status_id
      t.timestamps
    end
  end
end
