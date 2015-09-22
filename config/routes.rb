Rails.application.routes.draw do

  root "welcome#index"

  resources :candidates, only: [:index]
end
