Rails.application.routes.draw do
  resources :activities
  resources :habits
  resources :users

  root 'sessions#welcome'
end
