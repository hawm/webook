Rails.application.routes.draw do
  resources :users
  resources :authors
  resources :books
  root "home#index"
  get '/login', to: 'logins#login'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#logout'
  post '/logout', to: 'logins#destory'
  patch '/bookmark', to: 'bookmarks#toggle'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
