Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/books/:id', to: 'books#show'
  resources :books, only: [:show]

  resources :libraries, only: [:show] do
    resources :authors, only: [:index]
  end
  # get '/libraries/:id/authors', to: 'authors#index'
  # get '/libraries/:id', to: 'libraries#show'
end
