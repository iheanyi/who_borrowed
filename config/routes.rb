Rails.application.routes.draw do
  resources :users


  match '/register', to: "users#new", via: 'get'

  root :to => "visitors#index"

end
