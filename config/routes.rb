Rails.application.routes.draw do
  get "/books/:id", to: "books#show"

  get "/libraries/:id", to: "libraries#show"

  get "/libraries/:id/authors", to: "library_authors#index"
end
