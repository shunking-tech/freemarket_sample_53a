Rails.application.routes.draw do
  root 'items#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  resources :users, only: :show do
    resources :creditcards, only: [:index, :new, :create]
  end
  get 'logout', to: 'users#logout'
end
