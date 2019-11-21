require 'rails_helper'

RSpec.describe "individual shelter details", type: :feature do
  it "can display details for a shelter" do
    shelter_1= Shelter.create(name: "Purina Shelter",
                              address: "123 some road",
                              city: "denver",
                              state: "CO",
                              zip: 80204
                            )
    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end
