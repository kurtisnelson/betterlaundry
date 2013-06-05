require 'sidekiq/web'
Betterlaundry::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rooms do
        put :sync
      end
      resources :machines do
        put :notify
      end
    end
  end

  mount Sidekiq::Web => '/sidekiq'

  get '*foo', :to => 'ember#start'
  root to: "ember#start"
end
