Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  get 'booksIndex', to: 'books#index', as: 'booksIndex'
  resources :books do
    resources :copies
  end

  # get 'books', to: 'books#index', as: 'books'
  # post 'books', to: 'books#add'
  # get 'books/add', to: 'books#add', as: 'add_book'
  # get 'books/:id', to: 'books#show', as: 'book'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
end
