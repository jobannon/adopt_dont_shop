require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when I visit /pets" do
    it "shows
    -image
    -name
    -approximate age
    -sex
    -name of shelter where the pet is located at" do

      #not sure if i like this but wanted to try it

      shelter_1= Shelter.create!(name: "Purina Shelter",
                                address: "123 some road",
                                city: "denver",
                                state: "CO",
                                zip: 80204
                              )
      shelter_2= Shelter.create!(name: "Blue Buffalo Shelter",
                                address: "123 some other road",
                                city: "stapleton",
                                state: "CO",
                                zip: 80004
                              )

      expected = {
        image_url: "https://i.imgur.com/O7Mstm0.jpg",
        name: "cowboy",
        approximate_age: 17,
        sex: "male",
        shelter: shelter_1
      }

      expected_2 = {
        image_url: "https://i.imgur.com/UagaLGh.jpg",
        name: "cowgirl",
        approximate_age: 10,
        sex: "female",
        shelter: shelter_2
      }
      dog_1 = shelter_1.pets.create!(
        image_url: expected[:image_url],
        name: expected[:name],
        approximate_age: expected[:approximate_age],
        sex: expected[:sex],
        # shelter: expected[:shelter]
      )
      dog_2 = shelter_2.pets.create!(
        image_url: expected_2[:image_url],
        name: expected_2[:name],
        approximate_age: expected_2[:approximate_age],
        sex: expected_2[:sex],
        # shelter: expected_2[:shelter]
      )

    visit '/pets'

      expect(page).to have_css("img[src*='#{dog_1.image_url}']")
      expect(page).to have_content(dog_1.name)
      expect(page).to have_content(dog_1.approximate_age)
      expect(page).to have_content(dog_1.sex)
      expect(page).to have_content(dog_1.shelter.name)

      expect(page).to have_content(dog_2.name)
      expect(page).to have_content(dog_2.approximate_age)
      expect(page).to have_content(dog_2.sex)
      expect(page).to have_content(dog_2.shelter.name)
  end
end
end
