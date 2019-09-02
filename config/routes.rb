Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions'
 }
  resources :items
  resources :users

  get 'item/index' => 'item#index'
  root to: 'items#index'
  #get 'users/new' => 'users#new'
get 'users/sign_in' => 'users/sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
