Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root 'books#index'
  get 'booksIndex', to: 'books#index', as: 'booksIndex'
  resources :books do
    resources :copies
  end
  resources :users do
    resources :copies
  end
  resources :copies


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
end
