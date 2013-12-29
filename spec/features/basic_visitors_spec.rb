require 'spec_helper'

feature "Basic visitors" do

  # PT ID 63043982
  scenario "As a Visitor I want to see a home page for The Wedding App." do
    visit "/"
    page.should have_content("Welcome")
  end

end 
