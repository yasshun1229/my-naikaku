Rails.application.routes.draw do
  root to: "toppages#index" # トップページのルーティング
  
  get "signup", to: "users#new" # ユーザ登録ページのURLパターンをsignupにする設定
  resources :users, only: [:show, :create]
end
