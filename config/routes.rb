Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'
  resources :articles do
    resources :comments
  end
end