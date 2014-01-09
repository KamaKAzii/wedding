class CreateConsumerContacts < ActiveRecord::Migration
  def change
    create_table :consumer_contacts do |t|
      t.string :street_address_1
      t.string :street_address_2
      t.string :postcode
      t.string :phone_number
      t.boolean :gender

      t.timestamps
    end
  end
end
