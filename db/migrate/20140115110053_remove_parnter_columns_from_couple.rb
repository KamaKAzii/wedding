class RemoveParnterColumnsFromCouple < ActiveRecord::Migration
  def up
    remove_column :couples, :first_partner_id
    remove_column :couples, :second_partner_id
  end

  def down 
    add_column :couples, :first_partner_id, :integer
    add_column :couples, :second_partner_id, :integer
  end
end
