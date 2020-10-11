Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]

  root 'static#home'

  get '/users/new', to: 'user#new', as: 'new_user'
  get '/users', to:'user#index', as: 'users'
  post '/users', to:'user#create'
  get '/users/:id', to: 'user#show', as: 'user'
  get '/users/:id/edit', to: 'user#edit', as: 'edit_user'

  get '/signin', to: 'session#new', as: 'signin'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

end
