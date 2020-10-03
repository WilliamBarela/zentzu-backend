Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :people, only: [:create]
      post '/login', to: 'auth#create'
      post '/signup', to: 'registration#create'
      get '/profile', to: 'people#profile'
    end
  end
end
