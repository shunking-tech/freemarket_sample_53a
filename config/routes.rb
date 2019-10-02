Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get "sign_up", to: "users/registrations#new"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#logout"
    delete "logout", to: "users/sessions#destroy"

    get "sign_up/top", to: "users/registrations#top"
    get "sign_up/sms_authorization", to: "users/registrations#sms_authorization"
    get "sign_up/deliver_address", to: "users/registrations#deliver_address"
    get "sign_up/creditcard", to: "users/registrations#creditcard"
    get "sign_up/finish", to: "users/registrations#finish"
  end

  root 'items#index'

  resources :items, only: [:index, :new, :show]
  resources :users, only: [:show, :create] do
    resources :creditcards, only: [:index, :new, :create]
    # 【マークアップ】ユーザー本人確認ページ を表示するための仮ルーティング
    collection do
      get :identification
    end
  end

  get 'profile_edit', to: 'users#profile_edit'

  # ルートの仮置きです
  resources :trades, only: [:new, :create]
end
