Rails.application.routes.draw do
  root "welcome#index"

  resources :orders
  resources :candidates, only: [:index, :show]
  resources :users, only: [:new, :create]
  resources :issues, only: [:index, :show]
  resources :donations, only: [:create, :edit]


  get "/cart", to: "cart#show"
  patch "/cart/:id", to: "cart#update"
  delete "/cart/:id", to: "cart#destroy"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#delete"

  get "/profile", to: "users#show"
end
