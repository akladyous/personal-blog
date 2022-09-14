Rails.application.routes.draw do
  resources :posts do
    resource :like, module: :posts, only: [:show, :create, :destroy]
  end
  resources :friendships, only: [:show, :new, :create, :destroy, :update]
  resources :me, only: :show

  resources :users, only: [] do
    resources :posts, only: :index
  end
  devise_for :users
  root 'home#index'
end
