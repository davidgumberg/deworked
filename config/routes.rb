Rails.application.routes.draw do
  resources :works do
    collection do
      get 'new/ext', to: 'works#ext', constraints: { isbn: /\d{10}(\d{3})?/ }
    end
    resources :voices
    resources :authors
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "works#index"
end
