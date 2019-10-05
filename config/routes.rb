Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#logout"
    delete "logout", to: "users/sessions#destroy"
    get "registrations/sms_confirmation", to: "users/registrations#sms_confirmation"
    get "registrations/deliver_address", to: "users/registrations#deliver_address"
    get "registrations/registration_complete", to: "users/registrations#registration_complete"
    get "registrations/creditcard", to: "users/registrations#creditcard"
    get "registrations/top", to: "users/registrations#top"
  end

  root 'items#index'

  resources :items, only: [:index, :new, :show] do
    post "likes", to: "item_likes#create"
    delete "likes", to: "item_likes#destroy"
  end
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
