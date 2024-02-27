Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :movies, only: %i[index show destroy update create]
  resources :users, only: %i[index show destroy update create]
  resources :sources, only: %i[index show destroy update create]
  resources :user_movies, only: %i[index show destroy update create]

  get '/movies/:id/cast', to: "movies#cast"
  get '/movies/:id/director', to: "movies#director"
  get '/movies/:id/source', to: "movies#source"
  
  # Defines the root path route ("/")
  # root "posts#index"
end
