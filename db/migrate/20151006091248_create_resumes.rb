class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :address1
      t.string :address2
      t.string :tel
      t.date :birthday
      t.string :sex
      t.string :shikaku
      t.string :menkyo

      t.timestamps null: false
    end
  end
end
