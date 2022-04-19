Rails.application.routes.draw do
  get '/books/:id', to: 'books#show'
end
