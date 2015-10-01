class ChangeStartdateToCampaigns < ActiveRecord::Migration
  def up
    change_column :campaigns, :startdate, :date
    change_column :campaigns, :enddate, :date
  end

  #変更前の型
  def down
    change_column :campaigns, :startdate, :datetime
    change_column :campaigns, :enddate, :datetime  
  end
end
