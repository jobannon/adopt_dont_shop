require "rails_helper"

RSpec.describe "as a visitor" do
  describe "visit the shelters index page" do
    before(:each) do
      @shelter_1= Shelter.create!(name: "tired shelter",
                                address: "563 work all day",
                                city: "denver",
                                state: "CO",
                                zip: 80204
                              )

      @dog_1 = @shelter_1.pets.create!(
        image_url: "https://i.imgur.com/O7Mstm0.jpg",
        name: "max",
        approximate_age: 7,
        sex: "male",
      )
      @dog_2 = @shelter_1.pets.create!(
        image_url: "https://i.imgur.com/srpQrcj.jpg",
        name: "max",
        approximate_age: 22,
        sex: "female",
      )
    end

    it "has a link to the shelters home " do
      visit "/shelters"

      within "#shelter-#{@shelter_1.id}" do
        click_link "#{@shelter_1.name}"
      end

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.state)
      expect(page).to have_content(@shelter_1.zip)

    end

  end
  describe "visit the pet shelter index page" do
    before(:each) do
      @shelter_1= Shelter.create!(name: "tired shelter",
                                address: "563 work all day",
                                city: "denver",
                                state: "CO",
                                zip: 80204
                              )

      @dog_1 = @shelter_1.pets.create!(
        image_url: "https://i.imgur.com/O7Mstm0.jpg",
        name: "max",
        approximate_age: 7,
        sex: "male",
      )
      @dog_2 = @shelter_1.pets.create!(
        image_url: "https://i.imgur.com/srpQrcj.jpg",
        name: "max",
        approximate_age: 22,
        sex: "female",
      )
    end

    it "has a link to shelters show" do
      visit "/shelters/#{@shelter_1.id}/pets"


        within "#pet-#{@dog_1.id}" do
          click_link "#{@shelter_1.name}"
        end

        expect(page).to have_content(@shelter_1.name)
        expect(page).to have_content(@shelter_1.address)
        expect(page).to have_content(@shelter_1.city)
        expect(page).to have_content(@shelter_1.state)
        expect(page).to have_content(@shelter_1.zip)

        visit "/shelters/#{@shelter_1.id}/pets"

        within "#pet-#{@dog_2.id}" do
          click_link "#{@shelter_1.name}"
        end

        expect(page).to have_content(@shelter_1.name)
        expect(page).to have_content(@shelter_1.address)
        expect(page).to have_content(@shelter_1.city)
        expect(page).to have_content(@shelter_1.state)
        expect(page).to have_content(@shelter_1.zip)
    end
  end

end
