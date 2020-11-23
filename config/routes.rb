Rails.application.routes.draw do
  # resources :user_tasks

  resources :tasks do
    resources :subtasks
  end

  resources :subtasks
  delete '/subtasks/:id', to: 'subtasks#destroy', as: 'delete_subtask'
 
 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:new, :create]

  root 'static#home', as: 'home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]


  get '/users', to:'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'userhome'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'



  

end




