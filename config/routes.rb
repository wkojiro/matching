Rails.application.routes.draw do
  root to: 'static_pages#index'
  get 'client/signup', to:'clients#new'
  get 'user/signup', to:'users#new'

  resources :users
  resources :clients
end
