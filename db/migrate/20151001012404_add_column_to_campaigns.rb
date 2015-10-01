class AddColumnToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :startdate, :datetime
    add_column :campaigns, :enddate, :datetime
  end
end
