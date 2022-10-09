Rails.application.routes.draw do
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

  resources :reactions, only: [:create]

  resources :matching, only: [:index]

  resources :chatrooms, only: [:create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
