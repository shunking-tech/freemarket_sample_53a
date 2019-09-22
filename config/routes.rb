Rails.application.routes.draw do
  root 'items#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    get "sms_confirmation", to: "users/registrations#sms_confirmation"
    get "deliver_address", to: "users/registrations#deliver_address"
    get "registration_complete", to: "users/registrations#registration_complete"
    get "creditcard", to: "users/registrations#creditcard"
  end

  resources :users, only: [:show, :create] do
    resources :creditcards, only: [:index, :new, :create]
  end
  get 'logout', to: 'users#logout'
end
