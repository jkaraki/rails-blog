Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root route
  root to: 'posts#index'

  # Nested comments in posts route
  resources :posts do
    resources :comments
  end

  # Creates tag routes
  resources :tags

  # Creates users routes
  resources :users

  # Creates user_sessions routes
  resources :user_sessions, only: [ :new, :create, :destroy ]


  post '/users/:id/edit', to: 'user#show'

  # login route
  get '/login', to: 'user_sessions#new'

  # logout route
  get '/logout', to: 'user_sessions#destroy'
end
