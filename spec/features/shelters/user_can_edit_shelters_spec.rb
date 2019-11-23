require 'rails_helper'
RSpec.describe 'when I visit the shelter show page' do
  describe 'as a visitor' do
  it 'I see a link to update the shelter and can edit the shelters data through a form' do
    shelter_1= Shelter.create(name: "Purina Shelter",
                              address: "123 some road",
                              city: "denver",
                              state: "CO",
                              zip: 80204
                            )
      visit "/shelters/#{shelter_1.id}"

      click_link "Update Shelters Information"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

      name = "Whalestown"
      address = "123 some road"
      city = "denver"
      state = "CO"
      zip = 80204

      fill_in :name, with: name
      fill_in :address, with: address
      fill_in :city, with: city
      fill_in :state, with: state
      fill_in :zip, with: zip

      click_button "Save Updated Information"

      edited_shelter = Shelter.last
      expect(current_path).to eq("/shelters/#{shelter_1.id}")

      expect(page).to have_content(edited_shelter.name)
      expect(page).to have_content(edited_shelter.address)
      expect(page).to have_content(edited_shelter.city)
      expect(page).to have_content(edited_shelter.state)
      expect(page).to have_content(edited_shelter.zip)
    end
  end
end

# User Story 5, Shelter Update

# As a vis io
# When I visit a shelter show page
# Then I see a link to update the shelter
# When I click the link
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - RSme
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id'
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
