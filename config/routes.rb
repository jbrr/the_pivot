Rails.application.routes.draw do

  resources :orders
  root "welcome#index"

  resources :candidates, only: [:index, :show]
  resources :issues, only: [:index]
end
