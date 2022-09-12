Rails.application.routes.draw do
  resources :posts do
    resource :like, module: :posts, only: [:show, :create, :destroy]
  end
  root 'home#index'
  devise_for :users


end
