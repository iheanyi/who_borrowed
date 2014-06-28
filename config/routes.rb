Rails.application.routes.draw do
  resources :items

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  match '/register', to: "users#new", via: 'get'
  match '/login', to: 'sessions#new', via: 'get'
  match '/logout', to: 'sessions#destroy', via: 'delete'

  root :to => "visitors#index"

end
