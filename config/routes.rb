Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :users, only: :new
  resources :trails, only: :show
  resources :excuses, only: :index

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#show', as: 'dashboard'
  get "/signout" => "sessions#destroy", :as => :signout
  get "/search", to: 'locations#show'
  get "/location", to: 'trails#index'

end
