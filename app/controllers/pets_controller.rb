class PetsController < ApplicationController
  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:id])
      @pets = @shelter.pets.all
    else
      @pets = Pet.all
    end
  end

  def show
    @pets = Pet.find(params[:id])
  end
end
