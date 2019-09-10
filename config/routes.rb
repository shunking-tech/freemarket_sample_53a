Rails.application.routes.draw do
  root 'items#index'
  resources :users, only: :show
  get 'logout', to: 'users#logout'
  get 'identification', to: 'users#identification'
end
