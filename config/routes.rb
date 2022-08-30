Rails.application.routes.draw do
  resources :phones
  resources :emails
  resources :addresses
  resources :people
  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
