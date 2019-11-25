require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when I visit the pets index of shelter" do
    it "show all adoptable pets for that shelter" do
    shelter_1= Shelter.create!(name: "Purina Shelter",
                              address: "123 some road",
                              city: "denver",
                              state: "CO",
                              zip: 80204
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
      shelter: shelter_1
    }

    dog_1 = shelter_1.pets.create!(
      image_url: expected[:image_url],
      name: expected[:name],
      approximate_age: expected[:approximate_age],
      sex: expected[:sex],
      # shelter: expected[:shelter]
    )
    dog_2 = shelter_1.pets.create!(
      image_url: expected_2[:image_url],
      name: expected_2[:name],
      approximate_age: expected_2[:approximate_age],
      sex: expected_2[:sex],
      # shelter: expected_2[:shelter]
    )


    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_css("img[src*='#{dog_1.image_url}']")
    expect(page).to have_content("cowboy")
    expect(page).to have_content(17)
    expect(page).to have_content("male")
    expect(page).to have_content("#{shelter_1.name}")

    expect(page).to have_css("img[src*='#{dog_2.image_url}']")
    expect(page).to have_content("cowgirl")
    expect(page).to have_content(10)
    expect(page).to have_content("female")
    expect(page).to have_content("#{shelter_1.name}")



    end
  end
end
