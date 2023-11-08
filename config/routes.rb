Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :translations, only: [:new, :create, :show, :index]

  # Defines the root path route ("/")
  root to: 'translations#index'

end
