Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create]

  resources :candidates, only: [:index]
  resources :issues, only: [:index]

  get "/profile", to: "users#show"
end
