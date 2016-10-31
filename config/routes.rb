Rails.application.routes.draw do
  root "home#index"

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :links, only: [:update, :index]
    end
  end

  resources :users, only: [:new, :create, :show]
  resources :links, only: [:index, :create, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
