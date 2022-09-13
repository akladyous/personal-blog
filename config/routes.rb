Rails.application.routes.draw do
  resources :posts do
    resource :like, module: :posts, only: [:show, :create, :destroy]
  end
  resources :friendships, only: [:new, :create, :destroy]
  resources :me, only: :show
  devise_for :users
  root 'home#index'
end
