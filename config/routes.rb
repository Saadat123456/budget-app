Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  get '/users/:user_id', to: "splash#index", as: 'user'

  # Defines the root path route ("/")
  root "splash#index"
end
