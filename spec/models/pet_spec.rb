require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do
    it {should validate_presence_of :image_url}
    it {should validate_presence_of :name}
    it {should validate_presence_of :approximate_age}
    it {should validate_presence_of :sex}
    # it {should validate_presence_of :adopt_status}
  end
  describe "relationship" do
    it {should belong_to :shelter}
  end
end
