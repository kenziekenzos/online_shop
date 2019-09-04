Rails.application.routes.draw do
  resources :orders
  resources :carts
  devise_for :users
  resources :items
  resources :line_items
  root to: 'items#index'
end
