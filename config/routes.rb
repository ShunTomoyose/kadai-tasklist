Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get 'signup', to: 'users#new'
  # root to: 'tasks#index'
  root to: 'users#index'
  
  resources :tasks
  # resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :show, :new, :create]
  
end
