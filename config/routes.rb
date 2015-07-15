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
  resources :user_projects, only: [:show]
  
  # get "/users/:id", to: 'users#show'

  delete 'logout' => 'sessions#destroy'
  get :send_project_mail, to: 'projects#send_project_mail', as: :send_project_mail

  # get '/auth/:provider/callback' => 'users#callback'
  get '/auth/:provider/callback', to: 'sessions#create'

  post 'favourited/:user_project_id', to: 'user_projects#favourited', as: 'favourited'
  get 'favourited/:user_project_id' => 'user_projects#favourited'

  post 'completed/:user_project_id', to: 'user_projects#completed', as: 'completed'
  get 'completed/:user_project_id' => 'user_projects#completed'
end
