Rails.application.routes.draw do
  root to: "projects#index"
  
  devise_for :users

  resources :users, only: [:index, :show]
  resources :projects do
    resources :tasks
    resource :project_users, only: [:destroy, :create]
    # member do
    #   delete :delete_user
    # end
  end

  resources :tasks do
    resources :comments
  end

end
