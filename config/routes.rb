Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :categories, controller: :groups, only: [:index, :new, :create] do
    resources :budgetting_transactions, only: [:index, :new, :create]
  end

  unauthenticated do
    root 'splash#index'
  end
 
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  # Defines the root path route ("/")
  # root "splash#index"
end
