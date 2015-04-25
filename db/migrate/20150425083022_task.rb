class Task < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :desc
      t.integer :author_id
      t.integer :owner_id
      t.string :status

      t.timestamps
    end
  end
end
