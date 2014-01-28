class Job < ActiveRecord::Base

  belongs_to :marriage

  acts_as_taggable_on :tags

  def self.tag_search(terms)
    Job.tagged_with(terms, any: true)
  end

end
