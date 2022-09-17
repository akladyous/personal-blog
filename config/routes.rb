Rails.application.routes.draw do
  resources :posts do
    resource :like, controller: 'posts/likes', only: [:show, :create, :destroy]
    resources :tags, module: :posts
    resources :related, only: :index, module: :posts
    resources :comments, only: [:new, :create, :update, :destroy], module: :posts
  end

  resources :comments, only: [] do
    resources :comments, only: [:new, :create, :update, :destroy], module: :comments
  end

  resources :friendships, only: [:show, :new, :create, :destroy, :update]
  resources :me, only: :show

  resources :users, only: [] do
    resources :posts, only: :index
    resources :profile, except: :index ,module: :users
  end
  devise_for :users
  root 'home#index'
end
