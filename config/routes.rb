Rails.application.routes.draw do
  get '/', to: "welcome#index"
  get '/shelters', to: "shelters#index"
  get '/shelters/new', to: "shelters#new"
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: "shelters#show"
  get '/shelters/:id/edit', to: "shelters#edit"

  patch 'shelters/:id', to: "shelters#update"
  delete 'shelters/:id', to: "shelters#destroy"

  get "/shelters/:shelter_id/pets", to: "pets#index"

  get '/pets', to: "pets#index"
  get "/pets/:id", to: "pets#show"
  get "/pets/:id/edit", to: "pets#edit"
  patch '/pets/:id', to: "pets#update"
  delete "/pets/:id", to: 'pets#destroy'

  get "/shelters/:shelter_id/pets/new", to: "pets#new"

  post "/shelters/:shelter_id/pets/new", to: "pets#create"
  #this is bad code but is repeating my action path.
  post "/shelters/:shelter_id/pets/shelters/:shelter_id/pets", to: "pets#create"


end
