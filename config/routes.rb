Rails.application.routes.draw do
  root to: 'dashboard#index'

  devise_for :users

  resources :projects, only: [:index]
  resources :users, only: [:index]
end
