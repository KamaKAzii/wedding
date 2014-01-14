class User < ActiveRecord::Base

  has_secure_password

  has_one :consumer_contact
  has_one :service_contact
  has_one :marriage
  belongs_to :couple

  validates_uniqueness_of :email, message: "Please ender a unique email"

  def full_name
    first_name + " " + last_name
  end

end
