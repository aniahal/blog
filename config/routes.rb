Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
end