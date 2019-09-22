Rails.application.routes.draw do
  root 'items#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get "log_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    get "registrations/sms_confirmation", to: "users/registrations#sms_confirmation"
    get "registrations/deliver_address", to: "users/registrations#deliver_address"
    get "registrations/registration_complete", to: "users/registrations#registration_complete"
    get "registrations/creditcard", to: "users/registrations#creditcard"
    get "registrations/top", to: "users/registrations#top"
  end

  resources :users, only: [:show, :create] do
    resources :creditcards, only: [:index, :new, :create]
  end
  get 'logout', to: 'users#logout'
end
