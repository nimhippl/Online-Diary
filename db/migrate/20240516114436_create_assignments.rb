class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: { to_table: :users }
      t.date :start_date, null: false, default: -> { 'CURRENT_DATE' }

      t.timestamps
    end

    add_index :assignments, [:subject_id, :teacher_id], unique: true
  end
end
