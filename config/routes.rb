Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/libraries/:library_id/books/:book_id', to: 'books#show'

  get '/libraries/:library_id', to: 'libraries#show'
  get '/libraries/:library_id/authors', to: 'library_authors#index'
end
