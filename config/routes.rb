Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splashes#index"

  resources :categories, only: [:index, :show, :new, :create] do
    resources :records, only: [:index, :show, :new, :create]
  end
end
