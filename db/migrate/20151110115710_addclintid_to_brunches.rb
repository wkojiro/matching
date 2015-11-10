class AddclintidToBrunches < ActiveRecord::Migration
  def change
       add_reference :brunches, :client, index: true, foreign_key: true
       add_index :brunches, [:client_id, :created_at]
  end
end
