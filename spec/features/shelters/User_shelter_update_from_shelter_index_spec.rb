require 'rails_helper'

RSpec.describe "as a visitor " do
  describe "when I visit the shelter index page " do
    it " shows a link to edit shelters information next  each shelter AND
    I am taken to that shelters edit page where I can update" do

    visit "/shelters"

    end
  end
end
