class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  # def update
  #   task = Shelter.find(params[:id])
  #   task.update({
  #     title: params[:task][:description]
  #   })
  #   task.save
  #   redirect_to "/shelters/#{shelter.id}"
  # end
end
