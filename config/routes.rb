Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/books/:id', to: 'books#show'


  get '/libraries/:id', to: 'libraries#show'
end
