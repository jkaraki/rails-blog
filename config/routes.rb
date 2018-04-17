Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :users do
    resources :posts do
      resources :comments
    end
  end

  resources :tags

  # resources :users

  resources :user_sessions, only: [ :new, :create, :destroy ]

  # post '/users/:id/posts' => 'posts#create', as: 'user_posts'

  post '/users/:user_id/posts/new' => 'posts#create'

  patch '/users/:user_id/posts' => 'posts#create'

  get '/users/:user_id/posts' => 'posts#index'

  post '/users/:user_id/posts' => 'posts#index'

  get '/login', to: 'user_sessions#new'

  get '/logout', to: 'user_sessions#destroy'
end
