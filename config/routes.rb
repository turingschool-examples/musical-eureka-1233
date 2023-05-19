Rails.application.routes.draw do
  get '/ingredients', to: 'ingredients#index'

  get '/recipes/:id', to: 'recipes#show'
end
