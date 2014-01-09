class AddUserIdToConsumerContact < ActiveRecord::Migration
  def change
    add_column :consumer_contacts, :user_id, :integer
    add_index :consumer_contacts, :user_id
  end
end
