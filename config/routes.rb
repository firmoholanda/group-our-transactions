Rails.application.routes.draw do
  
  root 'static_pages#home'

  # users
  resources :users

  # static_pages
  resources :static_pages

  # session routes
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

end
