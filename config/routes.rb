Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items, only: [:index, :new, :create]
  resources :orders, only: [:index]
  resources :delivery, only: [:index]
end
