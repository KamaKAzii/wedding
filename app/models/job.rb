class Job < ActiveRecord::Base

  belongs_to :marriage

  acts_as_taggable_on :tags

end
