Rails.application.routes.draw do
  root "welcome#index"

  resources :orders
  resources :candidates, only: [:index, :show]
  resources :users, only: [:new, :create]
  resources :issues, only: [:index, :show]

  get "/profile", to: "users#show"
end
