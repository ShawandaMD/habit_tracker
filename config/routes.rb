Rails.application.routes.draw do

  resources :habits, only: [:index, :show] do
    resources :activities
  end

  resources :users, only: [:new, :create, :show] do
    resources :habits
  end

  root 'sessions#welcome'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end
