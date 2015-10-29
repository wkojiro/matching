class AddaddressToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :officeaddress, :text  , :after => :offce_address04  
  end
end
