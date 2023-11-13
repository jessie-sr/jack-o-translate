Rails.application.routes.draw do
  devise_for :models
  devise_for :controllers
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :translations
  # Defines the root path route ("/")
  root to: 'translations#index'

end
