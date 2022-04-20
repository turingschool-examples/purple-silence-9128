Rails.application.routes.draw do
  resources :libraries, only: [:show]
  resources :books, only: [:show]
end
