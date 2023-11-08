Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :translations, only: [:new, :create, :show]

  # Defines the root path route ("/")
  root 'pages#home'
end
