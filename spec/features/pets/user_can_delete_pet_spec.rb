require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "visit a show page
  -see a link to delete the pet
  the pet is deleted
  and go back to the pets index w/o this pet" do
    it "deletes pet" do

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

      dog_1= shelter_1.pets.create!(
        image_url: image_url,
        name: name,
        description: description,
        approximate_age: approximate_age,
        sex: sex,
        shelter_id: shelter_1
        )

      expected_2 = {
        image_url: "https://i.imgur.com/O7Mstm0.jpg",
        name: "cowboy",
        description: "something here",
        approximate_age: 17,
        sex: "male",
        shelter: shelter_1,
        adopt_status: true
      }

      dog_2 = shelter_1.pets.create!(
        image_url: expected_2[:image_url],
        name: expected_2[:name],
        description: expected_2[:description],
        approximate_age: expected_2[:approximate_age],
        sex: expected_2[:sex],
        adopt_status: expected_2[:adopt_status]
      )

        visit "/pets/#{dog_1.id}/"

        click_link "Delete This Pet"


      expect(page).not_to have_content(dog_1.name)
      expect(page).not_to have_content(dog_1.approximate_age)
      expect(page).not_to have_content(dog_1.sex)
      expect(page).not_to have_content(dog_1.adopt_status)
      expect(page).not_to have_content(dog_1.description)
  end
end
end
