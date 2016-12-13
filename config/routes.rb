Rails.application.routes.draw do
  devise_for :users

  root "posters#index"

  resources :posters

  resources :users, only: [:show, :edit, :update]
end
