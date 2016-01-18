api_methods = [:index, :show, :create, :update, :destroy]

Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    namespace :rest do
      resources :filters, only: api_methods
      resources :games, only: api_methods
      resources :meetings, only: api_methods
    end
  end
end
