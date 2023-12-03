Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :translations
  resources :users
  # Defines the root path route ("/")
  root to: 'translations#index'

end
