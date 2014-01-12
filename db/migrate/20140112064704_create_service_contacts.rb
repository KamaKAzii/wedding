class CreateServiceContacts < ActiveRecord::Migration
  def change
    create_table :service_contacts do |t|
      t.string :street_address_1
      t.string :street_address_2
      t.string :postcode
      t.string :landline_number
      t.string :mobile_number
      t.string :fax_number
      t.string :website
      t.string :email
      t.integer :user_id

      t.timestamps
    end

    add_index :service_contacts, :user_id
  end
end
