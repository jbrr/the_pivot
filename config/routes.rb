Rails.application.routes.draw do

  root "welcome#index"

  resources :candidates, only: [:index]
  resources :issues, only: [:index]
end
