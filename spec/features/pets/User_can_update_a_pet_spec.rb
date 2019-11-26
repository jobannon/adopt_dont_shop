require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "visit a pets show page" do
    it "has a link to update pet
        has a form to update with the attribute fields "do

        shelter_1= Shelter.create(name: "Purina Shelter",
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

        pet_1 = shelter_1.pets.create!(
          image_url: image_url,
          name: name,
          description: description,
          approximate_age: approximate_age,
          sex: sex,
          shelter_id: shelter_1
          )

      visit "/pets/#{pet_1.id}/"
      # visit "/shelters/#{shelter.id}/pet"
      # binding.pry
      click_link "Update This Pet"

      edit_image_url = "https://i.imgur.com/jMC42nf.jpg"
      edit_name = "duckyedited"
      edit_description = "duckybarelylivesedited"
      edit_approximate_age = 21
      edit_sex = "male"

      fill_in :image_url, with: edit_image_url
      fill_in :name, with: edit_name
      fill_in :description, with: edit_description
      fill_in :approximate_age, with: edit_approximate_age
      fill_in :sex, with: edit_sex

      click_button "Submit"

      edited_pet = Pet.last
save_and_open_page
      expect(page).to have_css("img[src*='#{edited_pet.image_url}']")
      expect(page).to have_content(edited_pet.name)
      expect(page).to have_content(edited_pet.description)
      expect(page).to have_content(edited_pet.approximate_age)
      expect(page).to have_content(edited_pet.sex)

    end
  end
end
