class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.integer :role, default: 0
      t.boolean :verified, default: false
      t.string :email
      t.string :password_digest
    end
  end
end