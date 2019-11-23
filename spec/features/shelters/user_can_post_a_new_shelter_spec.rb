require 'rails_helper'
RSpec.describe 'post a new shelter', type: :feature do
  it "I can click a link that allows me to create a new shelter through a form" do

    visit "/shelters"
    click_link "Add New Shelter"

    expect(current_path).to eq('/shelters/new')
    fill_in :name, with: "name"
    fill_in :address, with: "address"
    fill_in :city, with: "city"
    fill_in :state, with: "state"
    fill_in :zip, with: 12345
    click_button "Create New Shelter"

    expect(current_path).to eq('/shelters')
    expect(page).to have_content("name")
  end
end
