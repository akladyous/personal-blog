Rails.application.routes.draw do
  # namespace :posts do
  #   resource :tags
  # end
  resources :posts do
    resource :like, module: :posts, only: [:create, :destroy]
  end
  root 'home#index'
  devise_for :users
end
