Rails.application.routes.draw do
  get '/book/:id', to: 'books#show'
  get '/library/:id', to: 'libraries#show'
  get '/library/:library_id/authors', to: 'library_authors#index'
end
