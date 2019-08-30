Rails.application.routes.draw do
  root 'tests#index'
  resources :tests, only: [:index, :create]
end
