Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "logout", to: "users/sessions#logout"
    delete "logout", to: "users/sessions#destroy"
  end

  root 'items#index'
  resources :items, only: [:index, :new, :show]
  resources :users, only: :show do
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
