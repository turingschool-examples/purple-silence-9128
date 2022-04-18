Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :libraries, only: [:show] do 
    resources :books, only: [:show] 
  end  

  get '/libraries/:id/authors', to: 'library_authors#index'

end
