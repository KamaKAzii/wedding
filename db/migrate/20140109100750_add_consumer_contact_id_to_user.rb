class AddConsumerContactIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :consumer_contact_id, :integer
    add_index :users, :consumer_contact_id
  end
end
