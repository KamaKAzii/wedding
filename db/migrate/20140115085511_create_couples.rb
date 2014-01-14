class CreateCouples < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.integer :first_partner_id
      t.integer :second_partner_id
      t.references :marriage, index: true

      t.timestamps
    end
  end
end
