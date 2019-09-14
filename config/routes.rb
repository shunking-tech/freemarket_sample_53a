Rails.application.routes.draw do
  root 'items#index'
  resources :users, only: :show do
    resources :creditcards, only: [:index, :new, :create]

    # 【マークアップ】ユーザー本人確認ページ を表示するための仮ルーティング
    collection do
      get :identification
    end
  end
  get 'logout', to: 'users#logout'
end
