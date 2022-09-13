Rails.application.routes.draw do
  resources :posts do
    resource :like, module: :posts, only: [:show, :create, :destroy]
  end
  devise_for :users
  resources :me, only: :show


  root 'home#index'
end
