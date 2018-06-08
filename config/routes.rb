Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :users, only: %i(show)
  resources :tweets, only: %i(create destroy)
end
