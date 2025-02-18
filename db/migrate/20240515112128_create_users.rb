class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :type
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :type

  end
end
