Rails.application.routes.draw do
  root to: "toppages#index" # トップページのルーティング
  
  get "login", to: "sessions#new" # ログインページのURIパターンを"login"にする設定
  post "login", to: "sessions#create" # ログインページのURIパターンを"login"にする設定
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new" # ユーザ登録ページのURLパターンを"signup"にする設定
  resources :users, only: [:index, :show, :create] do
    member do # idが含まれるURLの生成（ユーザの特定が必要）
      get :likes
    end
  end
  
  get "signup", to: "users#new"
  
  resources :cabinets
  resources :favorites, only: [:create, :destroy]
end
