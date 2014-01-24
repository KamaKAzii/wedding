class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :title
      t.date :date
      t.references :user, index: true

      t.timestamps
    end
  end
end
