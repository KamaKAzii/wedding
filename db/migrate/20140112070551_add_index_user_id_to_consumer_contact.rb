class AddIndexUserIdToConsumerContact < ActiveRecord::Migration
  def change
    add_index :consumer_contacts, :user_id
  end
end
