class RenameColumnType < ActiveRecord::Migration
  def change
    rename_column :categories, :type, :genre
  end
end
