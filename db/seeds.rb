Shelter.destroy_all
Pet.destroy_all

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
expected = {
  image_url: "https://i.imgur.com/O7Mstm0.jpg",
  name: "cowboy",
  approximate_age: 17,
  sex: "male",
  shelter: "cow town"
}

expected_2 = {
  image_url: "https://i.imgur.com/UagaLGh.jpg",
  name: "cowgirl",
  approximate_age: 10,
  sex: "female",
  shelter: "cow town"
}

dog_1 = Pet.create(
  image_url: expected[:image_url],
  name: expected[:name],
  approximate_age: expected[:approximate_age],
  sex: expected[:age],
  shelter: expected[:shelter]
)
dog_2 = Pet.create(
  image_url: expected_2[:image_url],
  name: expected_2[:name],
  approximate_age: expected_2[:approximate_age],
  sex: expected_2[:age],
  shelter: expected_2[:shelter]
)
