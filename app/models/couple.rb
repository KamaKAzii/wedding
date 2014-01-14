class Couple < ActiveRecord::Base

  belongs_to :marriage
  has_many :users

end
