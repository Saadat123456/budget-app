Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  get 'categories/new', to: 'groups#new', as: 'new_group'
  
  unauthenticated do
    root 'splash#index'
  end
 
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  # Defines the root path route ("/")
  # root "splash#index"
end
