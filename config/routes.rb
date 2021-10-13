Rails.application.routes.draw do
  root to: "toppages#index" # トップページのルーティング
  
  get "login", to: "sessions#new" # ログインページのURIパターンを"login"にする設定
  post "login", to: "sessions#create" # ログインページのURIパターンを"login"にする設定
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new" # ユーザ登録ページのURLパターンを"signup"にする設定
  resources :users, only: [:show, :create]
  
  resources :cabinets
end
