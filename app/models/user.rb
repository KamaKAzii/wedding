class User < ActiveRecord::Base

  has_secure_password

  has_one :consumer_contact

  def full_name
    first_name + " " + last_name
  end

end
