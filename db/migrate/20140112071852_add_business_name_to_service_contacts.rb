class AddBusinessNameToServiceContacts < ActiveRecord::Migration
  def change
    add_column :service_contacts, :business_name, :string
  end
end
