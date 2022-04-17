Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/books/:id', to: 'books#show'
  resources :books, only: [:show]

  resources :libraries, only: [:show] do 
    resources :library_authors, only: [:index]
    
  # get '/libraries/:id', to: 'libraries#show'

  # get '/libraries/:id/authors', to: 'library_authors#index'

  end 
end
