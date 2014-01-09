class RemoveIndexConsumerTableFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :consumer_contact_id, :integer
    remove_index :consumer_contacts, :user_id
  end
end
