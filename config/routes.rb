Rails.application.routes.draw do
  resources :posts do
    resource :like, controller: 'posts/likes', only: [:show, :create, :destroy]
    resources :tags, controller: 'posts/tags'
    resources :related, controller: 'posts/related', only: :index
    resources :comments, only: [:new, :create, :destroy], module: :posts
  end

  resources :comments, only: [] do
    resources :comments, only: [:new, :create, :destroy], module: :comments
  end

  resources :friendships, only: [:show, :new, :create, :destroy, :update]
  resources :me, only: :show

  resources :users, only: [] do
    resources :posts, only: :index
  end
  devise_for :users
  root 'home#index'
end
