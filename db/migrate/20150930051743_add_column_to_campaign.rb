class AddColumnToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :opflg, :string
  end
end
