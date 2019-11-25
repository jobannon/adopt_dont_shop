class Pet < ApplicationRecord
  validates_presence_of :image_url, :name, :approximate_age, :sex 
  belongs_to :shelter
end
