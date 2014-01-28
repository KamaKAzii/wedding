require "spec_helper"

describe Job do
  # PT ID 64217922
  it "I want to be able to search for a Job by Tags." do
    job = build(:job)
    tags_as_string = "Sometag, Anothertag, Blooptag"
    tags_as_array = tags_as_string.split(",").collect(&:strip)
    job.tag_list = tags_as_string
    job.save!

    result = Job.tag_search(tags_as_array)
    result.should have_at_least(1).things
  end
end
