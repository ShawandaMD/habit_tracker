Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show] do
    resources :habits
  end

  resources :habits, only: [:index, :show] do
    resources :activities
  end

  root 'sessions#welcome'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
