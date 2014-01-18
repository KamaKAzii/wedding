class AddActiveToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :active, :integer
  end
end
