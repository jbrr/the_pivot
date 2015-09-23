Rails.application.routes.draw do

  resources :orders
  resources :candidates, only: [:index, :show]
  root "welcome#index"
  resources :users, only: [:new, :create]
  resources :issues, only: [:index]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#delete"


  get "/profile", to: "users#show"
end
