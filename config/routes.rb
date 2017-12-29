Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update, :delete]
      resources :portfolios, only: [:create, :update, :delete]

      post '/signup', to: 'users#create', as: 'create_new_user'

      post '/login', to: 'auth#create', as: 'new_session'
      get '/current_user', to: 'auth#show', as: 'show_current_session'
      get '/snake', to: 'auth#snake', as: 'snake_path'

      get '/portfolios', to: 'portfolios#show', as: 'get_portfolios'
    end
  end
end
