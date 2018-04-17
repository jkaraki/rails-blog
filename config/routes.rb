Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :posts do
    resources :comments
  end

  resources :tags

  resources :users

  resources :user_sessions, only: [ :new, :create, :destroy ]

  get '/login', to: 'user_sessions#new'
  # 'user_sessions#new'

  get '/logout', to: 'user_sessions#destroy'
end
