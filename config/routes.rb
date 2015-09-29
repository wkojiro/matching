Rails.application.routes.draw do
  get 'client_sessions/new'

  get 'user_sessions/new'

  root to: 'static_pages#index'
  get 'client/signup', to:'clients#new'
  get 'user/signup', to:'users#new'

  get    'user/login'   => 'user_sessions#new'
  post   'user/login'   => 'user_sessions#create'
  delete 'user/logout'  => 'user_sessions#destroy'


  get    'client/login'   => 'client_sessions#new'
  post   'client/login'   => 'client_sessions#create'
  delete 'client/logout'  => 'client_sessions#destroy'


  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :clients
  resources :client_sessions, only: [:new, :create, :destroy]  
end
