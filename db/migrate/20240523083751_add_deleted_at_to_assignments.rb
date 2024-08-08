class AddDeletedAtToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :deleted_at, :datetime
    add_index :assignments, :deleted_at
  end
end
