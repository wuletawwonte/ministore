# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :inventory_items
    resources :users

    root to: 'inventory_items#index'
  end
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'admin/inventory_items#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :root
    end
  end
end
