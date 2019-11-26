class PetsController < ApplicationController
  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = @shelter.pets
    else
      @pets = Pet.all
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to "/pets/#{@pet.id}"
  end

  def create
    curr_shelter = Shelter.find(params[:shelter_id])

    Pet.create!({
      name: pet_params[:name],
      description: pet_params[:description],
      image_url: pet_params[:image_url],
      approximate_age: pet_params[:approximate_age],
      sex: pet_params[:sex],
      shelter_id: curr_shelter.id
      })

    redirect_to "/shelters/#{curr_shelter.id}/pets"
  end

private

  def pet_params
    params.permit(:name, :description, :image_url, :approximate_age, :sex, :shelter_id)
  end

end
