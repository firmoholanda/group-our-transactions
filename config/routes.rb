Rails.application.routes.draw do
  
  root 'static_pages#home'

  # static_pages
  get '/home',    to: 'static_pages#home'
  get '/about',   to: 'static_pages#about'

  # users
  get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  resources :users
  
  # session routes
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
  # projects
  get  '/projects_no_group', to: 'projects#index_projects_no_group'
  resources :projects
  
  # groups
  resources :groups

end
