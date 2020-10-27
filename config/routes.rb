Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]

  root 'static#home'

  get '/users', to:'user#index', as: 'users'
  get '/users/new', to: 'user#new', as: 'new_user'
  post '/users', to:'user#create'
  get '/users/:id', to: 'user#show', as: 'user'
  get '/users/:id/edit', to: 'user#edit', as: 'edit_user'

  get '/login', to: 'session#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'


  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

end




