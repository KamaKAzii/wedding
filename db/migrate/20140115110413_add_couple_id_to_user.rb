class AddCoupleIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :couple_id, :integer
    add_index :users, :couple_id
  end
end
