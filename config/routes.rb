Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users

  root to: "application#index" 
end
