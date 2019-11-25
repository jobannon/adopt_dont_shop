require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
    shelter_1= Shelter.create(name: "Purina Shelter",
                              address: "123 some road",
                              city: "denver",
                              state: "CO",
                              zip: 80204
                            )
    j
    shelter_2= Shelter.create!(name: "Blue Buffalo Shelter",
                              address: "123 some other road",
                              city: "stapleton",
                              state: "CO",
                              zip: 80004
                            )

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
