class AddDescAndAuthorToComments < ActiveRecord::Migration
  def change
    add_column :comments, :desc, :string
    add_column :comments, :author_id, :integer
  end
end
