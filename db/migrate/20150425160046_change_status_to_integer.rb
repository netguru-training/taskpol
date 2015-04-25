class ChangeStatusToInteger < ActiveRecord::Migration
  def up
    remove_column :tasks, :status
    add_column :tasks, :status_id, :integer
  end

  def down
    remove_column :tasks, :status_id
    add_column :tasks, :status, :string
  end
end
