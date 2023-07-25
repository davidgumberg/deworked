Rails.application.routes.draw do
  devise_for :users
  resources :works do
    collection do
      get 'new/ext', to: 'works#ext', constraints: { isbn: /\d{10}(\d{3})?/ }
      post 'new/ext', to: 'works#ext', constraints: { isbn: /\d{10}(\d{3})?/ }
      post :add_author
    end
    resources :voices
    resources :authors
  end

  resources :possessions

  resources :authors do
    collection do
      get 'search', to: 'authors#search'
      post 'search', to: 'authors#search'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "works#index"
end
