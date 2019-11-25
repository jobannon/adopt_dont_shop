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
dog_1= shelter_1.pets.create!(image_url: "https://i.imgur.com/O7Mstm0.jpg",
  name: "cowboy",
  approximate_age: 17,
  sex: "male",
)

dog_2= shelter_2.pets.create!(
  image_url: "https://i.imgur.com/UagaLGh.jpg",
  name: "cowgirl",
  approximate_age: 10,
  sex: "female",
)

dog_3 = shelter_1.pets.create!(  image_url: "https://i.imgur.com/srpQrcj.jpg",
  name: "justchillin",
  approximate_age: 20,
  sex: "female",
)
