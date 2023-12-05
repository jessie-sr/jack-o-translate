Rails.application.routes.draw do
  get 'users/show'
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'send_reset_password', to: 'users/registrations#send_reset_password_instructions'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :translations
  resources :users
  # Defines the root path route ("/")
  root to: 'translations#index'

end
