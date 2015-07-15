HeApp::Application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
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
  resources :comments, only: [:create]
  

  delete 'logout' => 'sessions#destroy'
  get :send_project_mail, to: 'projects#send_project_mail', as: :send_project_mail

  # get '/auth/:provider/callback' => 'users#callback'
  get '/auth/:provider/callback', to: 'sessions#create'
end
