require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when I visit the shelter pets index page" do
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

    it "has a link next to every pet to edit infomormation" do
      visit "/shelters/#{@shelter_1.id}/pets"

      within "#pet-#{@dog_1.id}" do
        click_link "Edit This Pet"
      end

      expect(current_path).to eq("/pets/#{@dog_1.id}/edit")

      visit "/shelters/#{@shelter_1.id}/pets"

      within "#pet-#{@dog_2.id}" do
        click_link "Edit This Pet"
      end

      expect(current_path).to eq("/pets/#{@dog_2.id}/edit")

    end



    end
  end
  describe "when I visit the pets index page" do
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

    it "has a link next to every pet to edit infomormation" do
      visit "/pets"

      within "#pet-#{@dog_1.id}" do
        click_link "Edit This Pet"
      end

      expect(current_path).to eq("/pets/#{@dog_1.id}/edit")

      visit "/pets"

      within "#pet-#{@dog_2.id}" do
        click_link "Edit This Pet"
      end

      expect(current_path).to eq("/pets/#{@dog_2.id}/edit")

    end
  end
