class CreateRescats < ActiveRecord::Migration
  def change
    create_table :rescats do |t|
      t.references :category, index: true, foreign_key: true
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
