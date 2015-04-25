Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show]
  resources :projects
  resources :tasks
  resources :activities

  root to: "application#index"
end
