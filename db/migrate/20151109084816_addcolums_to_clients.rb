class AddcolumsToClients < ActiveRecord::Migration
  def change
    rename_column :clients, :honsya_addres01, :honsya_address01
    rename_column :clients, :honsya_addres02, :honsya_address02
    rename_column :clients, :honsya_addres03, :honsya_address03
    rename_column :clients, :honsya_addres04, :honsya_address04    
  end
end
