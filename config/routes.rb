Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]

end

