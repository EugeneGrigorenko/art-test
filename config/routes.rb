Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  namespace :api do
    jsonapi_resources :artworks, except: [:create, :destroy]
  end
end
