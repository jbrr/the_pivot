Rails.application.routes.draw do
  root "welcome#index"

  namespace :admin do
    get "/dashboard", to: "dashboard#index"
    resources :user_roles, only: [:update]
    resources :campaign_managers, only: [:new, :create]
    resource  :candidates, path: ":candidate", as: :candidate,
              only: [:show, :edit, :update]
  end

  resources :candidate_issues, only: :update

  resources :two_factor_authentication, only: [:show, :update]

  resources :candidates, only: [:index, :show, :update]
  resources :issues, only: [:index, :show]
  resources :donations, only: [:create, :edit]
  resources :charges
  resources :orders, only: [:create, :show]


  get "/donations/undo", to: "donations#undo"

  get "/cart", to: "cart#show"
  patch "/cart/:id", to: "cart#update"
  delete "/cart/:id", to: "cart#destroy"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#delete"

  get "/join", to: "users#new"
  post "/join", to: "users#create"
  resources :user_roles, only: [:edit, :update]

  get "/profile", to: "users#show"
end
