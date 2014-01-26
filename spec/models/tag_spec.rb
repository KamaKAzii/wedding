require "spec_helper"

describe ActsAsTaggableOn::Tag do

  # PT ID 64218610
  it "As a Developer I want to seed Tags which know their level and whether they're original." do
    # Test a couple of the originals.
    original_tags = ActsAsTaggableOn::Tag.all
    original_tags.count.should be > 0

    flowers_tag = original_tags.where(name: "Flowers").first
    expect(flowers_tag.name).to eq("Flowers")
    expect(flowers_tag.level).to eq(0)
    expect(flowers_tag.original).to eq(true)
    
    photography_tag = original_tags.where(name: "Photography").first
    expect(photography_tag.name).to eq("Photography")
    expect(photography_tag.level).to eq(0)
    expect(photography_tag.original).to eq(true)
  end

end
