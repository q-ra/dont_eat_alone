Rails.application.routes.draw do
  resources :matchings
  resources :restaurants
  root 'home#index'

  devise_for :users
  # resources :restaurant
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
