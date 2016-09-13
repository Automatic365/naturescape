Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :users, only: [:new, :show]

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get "/signout" => "sessions#destroy", :as => :signout

end
