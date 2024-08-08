class CreateGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :grades do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :subject, null: false, foreign_key: true
      t.date :date
      t.integer :value

      t.timestamps
    end
  end
end
