require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "I can delete a pet from the index" do
    before(:each) do
      @shelter_1= Shelter.create!(name: "tired shelter",
                                address: "563 work all day",
                                city: "denver",
                                state: "CO",
                                zip: 80204
                              )

      @dog_1 = @shelter_1.pets.create!(
        image_url: "https://i.imgur.com/O7Mstm0.jpg",
        name: "maxy",
        approximate_age: 7,
        sex: "male",
      )
      @dog_2 = @shelter_1.pets.create!(
        image_url: "https://i.imgur.com/srpQrcj.jpg",
        name: "maxer",
        approximate_age: 22,
        sex: "female",
      )
    end
    it "deletes" do
      visit "/pets"

      within "#pet-#{@dog_1.id}" do
        click_link "Delete This Pet"
      end

      expect(current_path).to eq("/pets")
      expect(page).not_to have_content(@dog_1.name)


      within "#pet-#{@dog_2.id}" do
        click_link "Delete This Pet"
      end

      expect(current_path).to eq("/pets")
      expect(page).not_to have_content(@dog_2.name)


      end
  end
  describe "I can delete a pet from the shelter pets index" do
    before(:each) do
      @shelter_1= Shelter.create!(name: "tired shelter",
                                address: "563 work all day",
                                city: "denver",
                                state: "CO",
                                zip: 80204
                              )

      @dog_1 = @shelter_1.pets.create!(
        image_url: "https://i.imgur.com/O7Mstm0.jpg",
        name: "maxy",
        approximate_age: 7,
        sex: "male",
      )
      @dog_2 = @shelter_1.pets.create!(
        image_url: "https://i.imgur.com/srpQrcj.jpg",
        name: "maxer",
        approximate_age: 22,
        sex: "female",
      )
    end
    it "deletes" do
      visit "/shelters/#{@shelter_1.id}/pets"

      within "#pet-#{@dog_1.id}" do
        click_link "Delete This Pet"
      end

      expect(current_path).to eq("/pets")
      expect(page).not_to have_content(@dog_1.name)

      within "#pet-#{@dog_2.id}" do
        click_link "Delete This Pet"
      end

      expect(current_path).to eq("/pets")
      expect(page).not_to have_content(@dog_2.name)


      end
  end
end
