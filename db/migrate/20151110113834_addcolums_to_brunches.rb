class AddcolumsToBrunches < ActiveRecord::Migration
  def change
   rename_column :brunches, :brnchname, :brunchname      
  end
end
