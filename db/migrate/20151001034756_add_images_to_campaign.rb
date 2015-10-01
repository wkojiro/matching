class AddImagesToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :limage, :string
    add_column :campaigns, :image1, :string
    add_column :campaigns, :image2, :string
    add_column :campaigns, :image3, :string
    add_column :campaigns, :image4, :string
    add_column :campaigns, :youtube, :string

  end
end
