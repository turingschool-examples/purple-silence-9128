Rails.application.routes.draw do
  get '/books/:id', to: 'books#show'
  get '/libraries/:id', to:'libraries#show'
end
