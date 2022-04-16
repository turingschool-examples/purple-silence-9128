Rails.application.routes.draw do
  get '/book/:id', to: 'books#show'
  get '/library/:id', to: 'libraries#show'
end
