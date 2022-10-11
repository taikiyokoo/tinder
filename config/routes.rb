Rails.application.routes.draw do
  get 'grid_users/index'
  get 'chatrooms/create'
  get 'chatrooms/show'
  devise_for :users,
    controllers: { 
      registrations: 'registrations',
      sessions: :sessions
    }
    
  root 'top#index'
  get 'top/index'

  resources :users

  resources :reactions, only: [:create,:destroy]

  resources :matching, only: [:index]

  resources :chatrooms, only: [:create, :show]

  resources :grid_users,only: [:index,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
