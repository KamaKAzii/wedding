class Marriage < ActiveRecord::Base

  belongs_to :user
  has_one :couple
  has_many :events
  has_many :jobs

  accepts_nested_attributes_for :couple
  accepts_nested_attributes_for :events

end
