Rails.application.routes.draw do
  resources :libraries, only: [:show] do
    resources :books, only: [:show]
  end
end
