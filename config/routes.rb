Rails.application.routes.draw do
  resources :libraries, only: [:show] do
    resources :books, only: [:show]
  end

  get '/libraries/:id/authors', to: 'authors#index'
end
