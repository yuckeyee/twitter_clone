Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :users, only: %i(index show) do
    collection do
      get :search
    end
  end
  resources :tweets, only: %i(create destroy)
end
