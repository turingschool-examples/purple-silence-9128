Rails.application.routes.draw do
  resources :books, only: [:show]
  resources :libraries, only: [:show]

  resources :libraries do
  resources :authors, only: [:index]
  end
end
