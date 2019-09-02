Rails.application.routes.draw do
  resources :items
  get 'item/index' => 'item#index'
  root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
