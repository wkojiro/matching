class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :compname
      t.string :membername
      t.string :email
      t.string :password_digest

      t.timestamps null: false
      t.index :email, unique: true
    end
  end
end
