Rails.application.routes.draw do
  resources :works do
    resources :voices
    resources :authors
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "works#index"
end
