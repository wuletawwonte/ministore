# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :inventory_items
    resources :users
    resources :item_categories

    root to: 'inventory_items#index'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/auth/microsoft_office365/callback', to: 'omniauth_callbacks#microsoft_office365'

    authenticated :user do
      root to: 'admin/inventory_items#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :root
    end
  end
end
