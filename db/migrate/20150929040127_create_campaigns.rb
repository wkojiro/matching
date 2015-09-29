class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references :client, index: true, foreign_key: true
      t.text :title
      t.text :summary
      t.text :content

      t.timestamps null: false
      t.index [:client_id, :created_at]
    end
  end
end
