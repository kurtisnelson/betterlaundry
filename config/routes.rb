require 'sidekiq/web'
Betterlaundry::Application.routes.draw do
  resources :rooms do
    put :sync
    resources :machines do
      put :notify
    end
  end
  
  mount Sidekiq::Web => '/sidekiq'

  root to: 'rooms#index'
end
