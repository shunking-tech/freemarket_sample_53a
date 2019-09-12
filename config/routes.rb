Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: :show
  resources :users, only: :show
  get 'logout', to: 'users#logout'
end
