Rails.application.routes.draw do

  resources :orders
  resources :candidates, only: [:index, :show]
  root "welcome#index"
  resources :users, only: [:new, :create]
  resources :issues, only: [:index]

  get "/profile", to: "users#show"
end
