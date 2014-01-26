class AddLevelAndOriginalToTag < ActiveRecord::Migration
  def change
    add_column :tags, :level, :integer
    add_column :tags, :original, :bool
  end
end
