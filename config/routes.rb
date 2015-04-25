Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show]
  resources :projects

  root to: "application#index"
end
