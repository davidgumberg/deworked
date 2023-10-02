Rails.application.routes.draw do
  devise_for :users

  resources :users do
    scope module: :users, path: '' do
      resources :possessions
    end
  end

  resources :works do
    collection do
      get 'new/import', to: 'works#import'
      get 'new/cancel', to: 'works#new_cancel'
      get 'new/ext', to: 'works#ext', constraints: { isbn: /\d{10}(\d{3})?/ }
      post 'new/ext', to: 'works#ext', constraints: { isbn: /\d{10}(\d{3})?/ }
      post :add_author
    end
    resources :voices, :authors
  end

  resources :possessions, only: [:create, :destroy]

  resources :authors do
    collection do
      get 'search', to: 'authors#search'
      post 'search', to: 'authors#search'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "works#index"

  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end
end
