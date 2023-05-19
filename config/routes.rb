Rails.application.routes.draw do
  get '/ingredients', to: 'ingredients#index'
end
