class CreateBrunches < ActiveRecord::Migration
  def change
    create_table :brunches do |t|
      t.string :brnchname
      t.string :brunchnamefurigana
      t.string :brunch_postel01
      t.string :brunch_postel02
      t.string :brunch_address01
      t.string :brunch_address02
      t.string :brunch_address03
      t.string :brunch_address04
      t.string :brunch_station
      t.string :brunch_tel
      t.string :brunch_fax
      t.string :brunch_staffname
      t.string :brunch_staffnamefurigana
      t.string :brunch_staffemail
            
      t.timestamps null: false
    end
  end
end
