class RenameCampCatetoCampcat < ActiveRecord::Migration
  def change
      rename_table :camp_cates, :campcats #この行を追加！
  end
end
