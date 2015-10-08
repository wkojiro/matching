Rails.application.routes.draw do

#  get 'admin_sessions/new'

#  get 'admins/new'

#  get 'client_sessions/new'

#  get 'user_sessions/new'




  root to: 'static_pages#index'


 # get 'search/:q' =>  'static_pages#search'
  get 'client/signup', to:'clients#new'
  get 'user/signup', to:'users#new'
  get 'admin/signup', to:'admins#new'

  get    'user/login'   => 'user_sessions#new'
  post   'user/login'   => 'user_sessions#create'
  delete 'user/logout'  => 'user_sessions#destroy'


  get    'client/login'   => 'client_sessions#new'
  post   'client/login'   => 'client_sessions#create'
  delete 'client/logout'  => 'client_sessions#destroy'


  get    'admin/login'   => 'admin_sessions#new'
  post   'admin/login'   => 'admin_sessions#create'
  delete 'admin/logout'  => 'admin_sessions#destroy'

  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :clients
  resources :client_sessions, only: [:new, :create, :destroy]  
  resources :campaigns 
  resources :categories
  resources :resumes  
  resources :admins
  resources :admin_sessions, only: [:new, :create, :destroy]    
  resources :applies
end
