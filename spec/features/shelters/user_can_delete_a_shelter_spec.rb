require 'rails_helper'
RSpec.describe "as a visitor" do
it "I can click a link to delete a shelter on the shelter show page" do

  shelter_1= Shelter.create(name: "Purina Shelter",
                            address: "123 some road",
                            city: "denver",
                            state: "CO",
                            zip: 80204
                          )
  visit "/shelters/#{shelter_1.id}"

  click_link("Delete Shelter")
  expect(page).to_not have_content(shelter_1.name)
  end
end
