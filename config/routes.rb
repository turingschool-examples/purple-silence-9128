Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:show]

  get "/libraries/:id/authors", to: "library_authors#index"

  resources :libraries, only: [:show]
end
