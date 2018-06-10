Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :users, only: %i(index show)
  resources :tweets, only: %i(create destroy)
  get 'search', to: 'users#search'
end
