Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show]
  resources :projects do
    resource :project_users, only: [:destroy, :create]
    # member do
    #   delete :delete_user
    # end
  end
  resources :tasks

  root to: "application#index"
end
