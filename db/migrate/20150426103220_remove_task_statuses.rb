class RemoveTaskStatuses < ActiveRecord::Migration
  def up
    drop_table :task_statuses
    remove_column :tasks, :desc
    add_column :tasks, :markdown_desc, :text
    add_column :tasks, :html_desc, :text
  end

  def down
    remove_column :tasks, :html_desc
    remove_column :tasks, :markdown_desc
    add_column :tasks, :desc, :string
    create_table :task_statuses do |t|
      t.integer  :task_id
      t.integer  :status_id
      t.timestamps
    end
  end
end
