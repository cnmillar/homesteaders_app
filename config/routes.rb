HeApp::Application.routes.draw do
  get "homes/show"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'pages#home'

  # post "/session/login", to: 'users#login'
  # get "/session/logout", to: 'users#logout'

  resources :home, only: [:index]
  resources :categories, only: [:index, :show]
  resources :projects, only: [:index, :show]
  resources :users, only: [:new, :show]
  
  get 'signup'  => 'users#new' 
  resources :users


end
