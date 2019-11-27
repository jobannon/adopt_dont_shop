require 'rails_helper'

RSpec.describe "as a visitor " do
  describe "when I visit the shelter index page " do
    before(:each) do
      @shelter_3= Shelter.create(name: "Purina Shelter",
                                address: "123 some road",
                                city: "denver",
                                state: "CO",
                                zip: 80204
                              )

      @shelter_1= Shelter.create(name: "Cowboy Shelter",
                                address: "123 some road",
                                city: "denver",
                                state: "CO",
                                zip: 80204
                              )

      @shelter_2= Shelter.create!(name: "Blue Buffalo Shelter",
                                address: "123 some other road",
                                city: "stapleton",
                                state: "CO",
                                zip: 80004
                              )
    end
    it " shows a link to edit shelters information next  each shelter AND
    I am taken to that shelters edit page where I can update" do
    visit "/shelters"

    within "#shelter-#{@shelter_1.id}" do
      click_link "Edit Shelter"
    end

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")


    visit "/shelters"

    within "#shelter-#{@shelter_2.id}" do
     click_link "Edit Shelter"
    end

    expect(current_path).to eq("/shelters/#{@shelter_2.id}/edit")
    end


   it "I can delete a shelter through a link" do
    visit '/shelters'

    within "#shelter-#{@shelter_3.id}" do
     click_link "Delete Shelter"
    end

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content("#{@shelter_3.name}")
  end
end end
