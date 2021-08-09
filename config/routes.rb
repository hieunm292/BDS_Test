Rails.application.routes.draw do

  resources :properties
  get "/dashboard", to: "dashboard#index"
  get 'dashboard/properties'
  get 'dashboard/reports'

  root 'static_pages#home'

  get '/blog', to: 'static_pages#blog'
  get '/advertising', to: "static_pages#advertising"
  get 'signup', to: 'accounts#new'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :accounts
  resources :properties, only: [:create,:update, :destroy]
end
