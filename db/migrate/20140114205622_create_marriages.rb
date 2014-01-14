class CreateMarriages < ActiveRecord::Migration
  def change
    create_table :marriages do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
