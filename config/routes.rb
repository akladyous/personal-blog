Rails.application.routes.draw do
  resources :posts do
    resource :like, controller: 'posts/likes', only: %i[show create destroy]
    resources :tags, module: :posts
    resources :related, only: :index, module: :posts
    resources :comments, except: :index, module: :posts
  end

  resources :comments, only: [] do
    resources :comments, only: %i[new create edit update destroy], module: :comments
  end

  resources :friendships, only: %i[show new create destroy update]
  resources :me, only: :show

  resource :me, only: [:show] do
    resource :profile
    resources :posts, only: :index
    resources :notifications
    # resources :profile, except: :index, module: :users
  end

  # resources :users, only: [] do
  #   resources :posts, only: :index
  #   resources :profile, except: :index ,module: :users
  # end
  devise_for :users
  scope model: 'contact' do
    get 'contact', to: 'contact#index'
    post 'contact', to: 'contact#create'
  end
  root 'home#index'
end
