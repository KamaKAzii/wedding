class Job < ActiveRecord::Base


  belongs_to :marriage

  acts_as_taggable_on :tags
  acts_as_taggable_on :themes

  include PgSearch
  pg_search_scope :job_keyword_search, against: [:title, :description],
    using: { tsearch: { dictionary: "english" }}

  def self.tag_search(terms)
    Job.tagged_with(terms, any: true)
  end

  def self.keyword_search(terms)
    job_keyword_search(terms)
  end

end
