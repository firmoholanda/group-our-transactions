Rails.application.routes.draw do
  
  root 'static_pages#home'

  # users
  resources :users

  # static_pages
  get '/home',    to: 'static_pages#home'
  get '/about',   to: 'static_pages#about'

  # session routes
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

end
