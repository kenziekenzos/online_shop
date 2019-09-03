Rails.application.routes.draw do
  resources :orders
  resources :carts
  devise_for :users
  resources :items
  root to: 'items#index'
end
