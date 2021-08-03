Rails.application.routes.draw do

  root 'static_pages#home'
  
  get '/blog', to: 'static_pages#blog'
  get '/advertising', to: "static_pages#advertising"
  get 'signup', to: 'accounts#new'

  resources :accounts
end
