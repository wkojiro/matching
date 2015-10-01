class CreateCampCates < ActiveRecord::Migration
  def change
    create_table :camp_cates do |t|
      t.references :category, index: true, foreign_key: true
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
