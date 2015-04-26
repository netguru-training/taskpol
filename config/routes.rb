Rails.application.routes.draw do
  root to: "projects#index"

  devise_for :users, :controllers => { :registrations => 'registrations' }

  resources :users, only: [:index, :show]
  resources :projects do
    resources :tasks do
      collection do
        post "update_tasks"
      end
      resources :comments
    end
    resource :project_users, only: [:destroy, :create]
  end

end
