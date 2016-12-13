Rails.application.routes.draw do
  devise_for :users

  root "posters#index"

  resources :posters do
    resources :comments
  end

  resources :users, only: [:show, :edit, :update]

  # ресурсы категорий объявлений
  get 'childrens_world' => 'posters#childrens_world'
  get 'animals' => 'posters#animals'
  get 'fashion_and_style' => 'posters#fashion_and_style'
  get 'property' => 'posters#property'
  get 'transport' => 'posters#transport'
  get 'electronics' => 'posters#electronics'
end
