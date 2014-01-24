class User < ActiveRecord::Base

  has_secure_password

  has_one :consumer_contact
  has_one :service_contact
  has_one :marriage
  has_many :posts
  has_many :photos
  has_many :invites
  has_many :appointments
  belongs_to :couple

  validates :email, 
    presence: { message: "This can't be blank" },
    uniqueness: { message: "That email has been taken" }

  def full_name
    first_name + " " + last_name
  end

end
