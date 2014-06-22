require 'sidekiq/web'

Rails.application.routes.draw do
  resources :leads do
    collection { post :import }
    collection { post :email }
  end

  concern :pageable do
    get 'page/:page', action: :index, on: :collection
  end

  # you may want to protect this behind authentication
  mount Sidekiq::Web => '/sidekiq'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'
end
