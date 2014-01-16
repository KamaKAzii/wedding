class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.datetime :application_due_date
      t.references :marriage, index: true

      t.timestamps
    end
  end
end
