class Marriage < ActiveRecord::Base

  belongs_to :user
  has_one :couple

  accepts_nested_attributes_for :couple

end
