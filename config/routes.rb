# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'pages#splash', as: :unauthenticated_root
  end

  resources :groups do
    resources :operations
  end
end
