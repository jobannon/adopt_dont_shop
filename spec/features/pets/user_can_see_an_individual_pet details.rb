require 'rails-helper'

shelter_1= Shelter.create!(name: "Purina Shelter",
                          address: "123 some road",
                          city: "denver",
                          state: "CO",
                          zip: 80204
                        )

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
