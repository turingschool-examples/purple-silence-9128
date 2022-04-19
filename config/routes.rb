Rails.application.routes.draw do
  get '/libraries/:id/books/:id', to: 'books#show'
end
