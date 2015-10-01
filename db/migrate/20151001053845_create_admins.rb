class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
      
      t.index :email, unique: true
    end
  end
end
