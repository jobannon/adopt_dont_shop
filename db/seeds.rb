Shelter.destroy_all
Pet.destroy_all

shelter_1= Shelter.create!(name: "Purina Shelter",
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
  shelter: shelter_1
}

expected_2 = {
  image_url: "https://i.imgur.com/UagaLGh.jpg",
  name: "cowgirl",
  approximate_age: 10,
  sex: "female",
  shelter: shelter_2
}

expected_3 =   {
  image_url: "https://i.imgur.com/srpQrcj.jpg",
  name: "justchillin",
  approximate_age: 20,
  sex: "female",
  shelter: shelter_1
}

dog_1 = Pet.create!(
  image_url: expected[:image_url],
  name: expected[:name],
  approximate_age: expected[:approximate_age],
  sex: expected[:sex],
  shelter: expected[:shelter]
)
dog_2 = Pet.create!(
  image_url: expected_2[:image_url],
  name: expected_2[:name],
  approximate_age: expected_2[:approximate_age],
  sex: expected_2[:sex],
  shelter: expected_2[:shelter]
)

dog_3 = Pet.create!(
  image_url: expected_3[:image_url],
  name: expected_3[:name],
  approximate_age: expected_3[:approximate_age],
  sex: expected_3[:sex],
  shelter: expected_3[:shelter]
)
