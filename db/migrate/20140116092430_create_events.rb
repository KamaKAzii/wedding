class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :street_address_1
      t.string :street_address_2
      t.string :postcode
      t.datetime :date
      t.references :marriage, index: true

      t.timestamps
    end
  end
end
