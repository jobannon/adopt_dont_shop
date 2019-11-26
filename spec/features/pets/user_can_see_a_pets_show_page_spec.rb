require 'rails_helper'

RSpec.describe "as a vistor" do
  describe "on a pets show page" do
  it "can see all details for a pet" do
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
      shelter: shelter_1,
      adopt_status: true
    }

    expected_2 = {
      image_url: "https://i.imgur.com/UagaLGh.jpg",
      name: "cowgirl",
      approximate_age: 10,
      sex: "female",
      shelter: shelter_2,
      adopt_status: false
    }

    dog_1 = shelter_1.pets.create!(
      image_url: expected[:image_url],
      name: expected[:name],
      approximate_age: expected[:approximate_age],
      sex: expected[:sex],
      adopt_status: expected_2[:adopt_status]
    )
    dog_2 = shelter_1.pets.create!(
      image_url: expected_2[:image_url],
      name: expected_2[:name],
      approximate_age: expected_2[:approximate_age],
      sex: expected_2[:sex],
      adopt_status: expected_2[:adopt_status]
    )

    visit "/pets/#{dog_1.id}"

    expect(page).to have_css("img[src*='#{dog_1.image_url}']")
    expect(page).to have_content(dog_1.name)
    expect(page).to have_content(dog_1.approximate_age)
    expect(page).to have_content(dog_1.sex)
    expect(page).to have_content(dog_1.shelter.name)
    expect(page).to have_content(dog_1.adopt_status)

    visit "/pets/#{dog_2.id}"
    expect(page).to have_css("img[src*='#{dog_2.image_url}']")
    expect(page).to have_content(dog_2.name)
    expect(page).to have_content(dog_2.approximate_age)
    expect(page).to have_content(dog_2.sex)
    expect(page).to have_content(dog_2.shelter.name)
    expect(page).to have_content(dog_2.adopt_status)
    end
  end
end
