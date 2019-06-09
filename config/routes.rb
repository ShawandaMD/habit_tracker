Rails.application.routes.draw do
  resources :activities
  resources :habits
  resources :users, only: [:new, :create, :show]

  root 'sessions#welcome'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end
