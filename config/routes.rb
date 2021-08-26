Rails.application.routes.draw do
  root to: 'pages#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :roles
  resources :permissions
  resources :clients
  resources :hotels
end
