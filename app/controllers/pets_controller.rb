class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    # binding.pry
    params[:id]
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets.all

  end
end
