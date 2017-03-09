Rails.application.routes.draw do
  resources :coctails, only: [:index]
end
