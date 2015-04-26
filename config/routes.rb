Rails.application.routes.draw do
  root to: "projects#index"

  devise_for :users, :controllers => { :registrations => 'registrations' }

  resources :users, only: [:index, :show]
  resources :projects do
    resources :tasks do
      resources :comments
    end
    resource :project_users, only: [:destroy, :create]
  end
end
