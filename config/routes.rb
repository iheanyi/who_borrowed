require 'sidekiq/web'

Rails.application.routes.draw do
  resources :loans

  get 'authentications/index'

  resources :items

  resources :users
  resources :borrowers

  resources :sessions, only: [:new, :create, :destroy]

  resources :authentications

  # Login information
  match '/register', to: "users#new", via: 'get'
  match '/login', to: 'sessions#new', via: 'get'
  match '/logout', to: 'sessions#destroy', via: 'delete'

  # Login Information
  #match '/settings/user'

  # OmniAuth Routes
  match 'auth/:provider/callback', to: 'authentications#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  root :to => "visitors#index"

  mount Sidekiq::Web, at: "/sidekiq"

end
