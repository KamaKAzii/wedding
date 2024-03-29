class Photo < ActiveRecord::Base

  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100" }
  validates_attachment :image, :presence => true
  validates_with AttachmentPresenceValidator, attributes: :image

end
