Rails.application.routes.draw do
  resources :people do
    resources :addresses, only: [:create, :update, :destroy]
  end

  get 'sessions/new'
  get 'users/new'
  resources :phones
  resources :emails
  resources :addresses
  resources :people
  get 'about', to: 'pages#about'
  get '/register', to: 'users#new'
  resources :users, only: [:create]

  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
