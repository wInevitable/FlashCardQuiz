require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it "navigates to the Home Page"

  context "creating a new Flash Card" do
    #should have content link, link when clicked should take user to new flash card form
    it "has a link to create a new flash card"
    it "navigates to the new flash card upon clicking the link"
  end

  context "taking a quiz" do
    it "has a button to begin a new quiz"
  end

  context "viewing high scores" do
    it "has a link to view past high scores"
  end
end
