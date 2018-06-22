Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :users, only: %i(index show) do
    member do
      get :following, :followers
    end
  end
  resources :tweets, only: %i(create destroy)
  resources :relationships, only: %i(create destroy)
end
