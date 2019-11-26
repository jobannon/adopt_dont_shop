require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "visit shelter pets index" do
    it "shows a link for a new adoptable pet for that shelter and when i click the link i see a form to add a pet and a new pet is created for that shelter, the status is adoptable, and I am redirected to the shelter pets index page and see it listed" do

    shelter_1= Shelter.create!(name: "Purina Shelter",
                              address: "123 some road",
                              city: "denver",
                              state: "CO",
                              zip: 80204
                            )

      image_url = "https://i.imgur.com/0aeLs.jpg"
      name = "ducky"
      description = "duckybarelylives"
      approximate_age = 20
      sex = "female"

      visit "/shelters/#{shelter_1.id}/pets"

      click_link "Add new pet"

      fill_in :image_url, with: image_url
      fill_in :name, with: name
      fill_in :description, with: description
      fill_in :approximate_age, with: approximate_age
      fill_in :sex, with: sex

      click_button "Save New Pet Information"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")

      edited_pet = Pet.last

      expect(page).to have_css("img[src*='#{edited_pet.image_url}']")
      expect(page).to have_content(edited_pet.name)
      expect(page).to have_content(edited_pet.description)
      expect(page).to have_content(edited_pet.approximate_age)
      expect(page).to have_content(edited_pet.sex)

    end
  end
end
