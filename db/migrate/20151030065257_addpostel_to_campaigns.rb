class AddpostelToCampaigns < ActiveRecord::Migration
  def change
        add_column :campaigns, :offce_postel02, :text  , :after => :offce_postel
  end
end
