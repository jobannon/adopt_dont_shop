class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :image_url
      t.string :name
      t.integer :approximate_age
      t.string :sex
      t.string :shelter
    end
  end
end
