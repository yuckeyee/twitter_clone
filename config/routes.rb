Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets, only: [:create, :destroy]
  resources :users, :only => [:show]
end
