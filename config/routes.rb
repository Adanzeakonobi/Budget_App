# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'splashes#index'

  resources :categories, only: %i[index show new create] do
    resources :records, only: %i[index show new create]
  end
end
